///
/// Author       : zhongaidong
/// Date         : 2022-04-26 22:01:03
/// Description  : 首页 - 搜索 controller层
///
import 'package:blog/core/base/controller/base_page_get_controller.dart';
import 'package:blog/entity/hot_word_entity.dart';
import 'package:blog/utils/keyboard_util.dart';
import 'package:blog/utils/refresh_util.dart';
import 'package:blog/utils/sp_util/sp_util.dart';
import 'package:blog/widgets/refresh_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SearchController extends BasePageGetController {
  /// 当前热词Widget，由于热词从服务器加载，需要动态添加
  var hotWord = <HotWordEntity>[].obs;

  /// 搜索框输入词
  var changeText = ''.obs;

  /// 搜索历史记录，从SP中取出动态生成
  var history = <String>[].obs;

  /// 搜索结果
  // var searchResults = <ArticleEntity>[];

  /// 输入框文本控制器
  TextEditingController textController = TextEditingController();

  /// 是否展示搜索结果
  var isShowSearchResult = false.obs;

  @override
  void onInit() {
    super.onInit();
    // 获取搜索历史
    getSearchHistory();
    // 获取搜索热词
    getSearchHotWord();
  }

  @override
  void requestData(RefreshController controller,
      {RefreshState refresh = RefreshState.first}) {
    complexRequest.searchArticleByKeyWord(
      page: page,
      keyword: changeText.value,
      success: (data, over) {
        RefreshUtil.onSuccess(controller, refresh, over);

        // 下拉刷新需要清除列表
        if (refresh != RefreshState.up) datas.clear();

        datas.addAll(data);

        showSuccess(datas);
        update();
      },
      fail: (code, msg) {
        showError();
        RefreshUtil.onError(controller, refresh);
      },
    );
  }

  /// 获取搜索热词
  void getSearchHotWord() {
    complexRequest.getSearchHotWord(success: (data) {
      hotWord.value = data;
    });
  }

  /// 获取搜索历史数据
  void getSearchHistory() {
    var showHistories = SpUtil.getSearchHistory();

    // 最大显示10个历史记录
    if (showHistories.length > 10) {
      showHistories = showHistories.sublist(0, 10);
    }
    history.value = showHistories;
  }

  /// 清空搜索历史
  void clearSearchHistory() {
    SpUtil.deleteSearchHistory();
    history.value = [];
  }

  /// 点击搜索历史或者热搜榜中的[item]
  void hotOrHistorySearch(String item) {
    // 改变存储中的值
    changeText.value = item;
    // 改变输入框内容，并更新当前光标在尾部
    textController.text = item;
    // 光标移动到尾部
    textController.selection =
        TextSelection(baseOffset: item.length, extentOffset: item.length);
    // 开始搜索文章
    searchArticles();
  }

  /// 搜索项目文章
  void searchArticles() {
    if (changeText.value.isEmpty) return;

    page = 0;

    // 显示搜索结果Widget
    isShowSearchResult.value = true;
    showLoading();

    // 更新搜索历史
    SpUtil.saveSearchHistory(changeText.value);
    getSearchHistory();

    // 隐藏软键盘
    if (Get.context != null) {
      KeyboardUtil.hideKeyboard(Get.context!);
    }

    requestData(controller, refresh: RefreshState.first);
    isInit = false;
  }

  /// 清空搜索结果
  clearSearchResults() {
    datas.clear();
    update();
  }
}
