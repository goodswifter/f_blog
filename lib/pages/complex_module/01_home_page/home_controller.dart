///
/// Author       : zhongaidong
/// Date         : 2022-04-23 07:11:08
/// Description  : 首页控制器
///
import 'dart:math';

import 'package:blog/core/base/controller/base_page_get_controller.dart';
import 'package:blog/core/resource/r.dart';
import 'package:blog/entity/banner_entity.dart';
import 'package:blog/entity/wechat_public_entity.dart';
import 'package:blog/utils/refresh_util.dart';
import 'package:blog/widgets/refresh_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeController extends BasePageGetController {
  /// 首页Banner轮播图
  List<BannerEntity> banners = [];

  /// 微信公众号列表
  List<WechatPublicEntity> wechatPublics = [];

  /// 当前显示的微信公众号列表
  List<WechatPublicEntity> showWechatPublics = [];

  /// 插入公众号的索引
  var insertIndex = -1;

  /// 是否显示换一批按钮
  RxBool showSwitch = false.obs;

  /// 是否显示删除按钮
  RxBool showDelete = false.obs;

  /// 是否是第一次加载
  bool isFirst = true;

  @override
  void onInit() {
    super.onInit();
    getBanner();
  }

  /// 请求获取首页Banner图片
  getBanner() {
    complexRequest.getBanners(success: (data) {
      // 添加自定义的积分排行榜图片
      banners.add(BannerEntity(
        imagePath: R.assetsImagesRankingIntegralPng,
        isAssets: true,
      ));
      banners.addAll(data);

      // 预缓存banner图片
      for (var element in data) {
        if (Get.context != null) {
          precacheImage(NetworkImage(element.imagePath), Get.context!);
        }
      }
      update();
    });
  }

  /// 请求首页项目数据
  @override
  void requestData(RefreshController controller,
      {RefreshState refresh = RefreshState.first}) {
    complexRequest.requestHomeArticle(
      page: page,
      success: (data, over) {
        // 刷新成功
        RefreshUtil.onSuccess(controller, refresh, over);

        // 下拉刷新需要清除列表
        if (refresh != RefreshState.up) datas.clear();

        datas.addAll(data);
        showSuccess(datas);

        // 为了防止动画每次都加载，所以只需要在第一次出现时加载一次
        update();

        // 请求公众号数据
        if (datas.isNotEmpty && wechatPublics.isEmpty) {
          getWechatPublicData();
        }
      },
      fail: (code, msg) {
        // 刷新失败
        showError();
        RefreshUtil.onError(controller, refresh);
      },
    );
  }

  /// 请求完首页数据之后，请求微信公众号接口
  ///
  /// 随机取首页数据中间数值插入一列为公众号数据
  void getWechatPublicData() {
    complexRequest.getWechatPublic(success: (data) {
      wechatPublics = data;

      // 获取当前微信公众号插入索引
      insertIndex = getInsertIndexRandom();

      // 获取当前显示的2个随机公众号数据
      showWechatPublics = getRandomPublicData(data);
      update();
    });
  }

  /// 获取随机的公众号数据
  getRandomPublicData(List<WechatPublicEntity> data) {
    final _random = Random();
    var randomIndex = _random.nextInt(data.length - 2);
    return data.sublist(randomIndex, randomIndex + 2);
  }

  /// 获取公众号数据插入的索引处
  int getInsertIndexRandom() {
    final _random = Random();
    var randomIndex = _random.nextInt(datas.length - 1);
    if (randomIndex <= 3 && datas.length > 4) {
      return getInsertIndexRandom();
    }
    return randomIndex;
  }

  /// 换一批新的公众号
  void changeRandomPublic() {
    if (showSwitch.value) {
      showWechatPublics = getRandomPublicData(wechatPublics);
      update();
    } else {
      showSwitch.value = true;
    }
  }

  /// 点击背景隐藏显示的按钮
  void hideShowButtons() {
    showSwitch.value = false;
    showDelete.value = false;
  }
}
