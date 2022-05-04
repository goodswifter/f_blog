///
/// Author       : zhongaidong
/// Date         : 2022-04-22 21:41:13
/// Description  : 综合-首页
///
import 'package:blog/core/base/pages/get_save_state_view.dart';
import 'package:blog/pages/complex_module/01_home_page/widget/home_banner_widget.dart';
import 'package:blog/pages/complex_module/01_home_page/widget/home_wechat_public_widget.dart';
import 'package:blog/utils/web_util.dart';
import 'package:blog/widgets/refresh_widget.dart';
import 'package:blog/widgets/ripple_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';
import 'widget/home_article_item.dart';

class HomePage extends GetSaveStateView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshWidget<HomeController>(
        child: ListView.builder(
          itemCount: controller.datas.length +
              1 +
              (controller.insertIndex == -1 ? 0 : 1),
          itemBuilder: (BuildContext context, int index) {
            // 将轮播图装载到第一个位置
            if (index == 0) {
              return const HomeBannerWidget();
            } else if (index == controller.insertIndex) {
              return Obx(() => HomeWechatPublicWidget(
                    wechatPublics: controller.showWechatPublics,
                    isFirst: controller.isFirst,
                    onChange: () => controller.changeRandomPublic(),
                    showSwitch: controller.showSwitch(),
                    showDelete: controller.showDelete(),
                    onTap: () => controller.hideShowButtons(),
                  ));
            } else {
              // 计算当前显示的真实索引
              var newIndex = index -
                  (index > controller.insertIndex &&
                          controller.insertIndex != -1
                      ? 2
                      : 1);
              // item列表数据展示
              return Material(
                color: Colors.transparent,
                child: Ripple(
                  onTap: () => WebUtil.toWebPage(controller.datas[newIndex],
                      onResult: (value) {
                    controller.datas[newIndex].collect = value;
                  }),
                  child: HomeArticleItem(
                    item: controller.datas[newIndex],
                    index: newIndex,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
