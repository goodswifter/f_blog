///
/// Author       : zhongaidong
/// Date         : 2022-04-29 22:48:48
/// Description  : mine 数据Widget
///
import 'package:blog/core/base/pages/get_save_state_view.dart';
import 'package:blog/core/resource/shadow_handler.dart';
import 'package:blog/core/router/app_routes.dart';
import 'package:blog/generated/l10n.dart';
import 'package:blog/pages/mine_module/mine_controller.dart';
import 'package:blog/pages/mine_module/widget/data_content_item.dart';
import 'package:blog/utils/navigator_util.dart';
import 'package:blog/utils/toast_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MineDataWidget extends GetSaveStateView<MineController> {
  const MineDataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30, left: 25, right: 25),
      decoration: ShadowHandler.white12Circle(),
      child: Flex(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        direction: Axis.horizontal,
        children: [
          // 收藏数量
          Expanded(
            child: DataContentItem(
              title: S.of(context).homeCollect,
              content: controller.userinfo?.collectIds.length.toString() ?? '0',
              onTap: () => NavigatorUtil.gotoNamed(AppRoutes.collect),
            ),
          ),
          // 分享列表
          Expanded(
            child: Obx(() => DataContentItem(
                  title: S.of(context).homePartake,
                  content: '${controller.share}',
                  onTap: () => NavigatorUtil.gotoNamed(AppRoutes.share),
                )),
          ),
          // 积分
          Expanded(
            child: DataContentItem(
              title: S.of(context).homePoints,
              content: controller.userinfo?.coinCount.toString() ?? '0',
              onTap: () => NavigatorUtil.gotoNamed(AppRoutes.point),
            ),
          ),
          // 历史
          Expanded(
            child: Obx(
              () => DataContentItem(
                title: S.of(context).homeHistory,
                content: controller.browseHistory.toString(),
                onTap: () => Get.toNamed(AppRoutes.history),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
