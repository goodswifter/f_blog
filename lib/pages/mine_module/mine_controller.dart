///
/// Author       : zhongaidong
/// Date         : 2022-04-29 22:08:43
/// Description  : 我的 controller层
///
import 'package:blog/core/base/controller/base_get_controller.dart';
import 'package:blog/utils/sp_util/sp_util.dart';
import 'package:get/get.dart';

class MineController extends BaseGetController {
  /// 浏览历史长度
  var browseHistory = 0.obs;

  /// 分享的长度
  var share = 0.obs;

  @override
  void onInit() {
    super.onInit();
    var info = SpUtil.getUserinfo();
    if (info != null) {
      userinfo = info;
      update();
    }

    // 更新浏览历史文章的个数
    updateBrowseHistory();
  }

  /// 更新用户信息，每次进入时更新
  void updateUserinfo() {
    userinfoRequest.getUserinfo(success: (data) {
      userinfo = data;
      SpUtil.updateUserinfo(userinfo!);
      update();
    });
  }

  /// 更新分享的文章数据
  void updateShareArticle() {
    mineRequest.requestShareArticleList(length: (size) => share.value = size);
  }

  /// 更新浏览历史文章的个数
  void updateBrowseHistory() {
    browseHistory.value = SpUtil.getBrowseHistoryLength();
  }

  clearUserinfo() {
    SpUtil.deleteUserinfo();
    share.value = 0;
    userinfo = null;
    update();
  }
}
