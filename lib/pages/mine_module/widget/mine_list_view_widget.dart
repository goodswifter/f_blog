///
/// Author       : zhongaidong
/// Date         : 2022-04-29 23:23:40
/// Description  : 我的列表Widget
///
import 'package:blog/core/base/pages/get_save_state_view.dart';
import 'package:blog/core/resource/color_handler.dart';
import 'package:blog/core/resource/const_handler.dart';
import 'package:blog/core/resource/gap_handler.dart';
import 'package:blog/core/resource/shadow_handler.dart';
import 'package:blog/core/resource/text_style_handler.dart';
import 'package:blog/core/router/app_routes.dart';
import 'package:blog/generated/l10n.dart';
import 'package:blog/pages/mine_module/mine_controller.dart';
import 'package:blog/utils/navigator_util.dart';
import 'package:blog/widgets/dialog/share_dialog_widget.dart';
import 'package:blog/widgets/icon_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MineListViewWidget extends GetSaveStateView<MineController> {
  const MineListViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(top: 16, left: 25, right: 25),
      decoration: ShadowHandler.white12Circle(),
      child: Column(children: [
        // 积分排行榜
        GestureDetector(
          onTap: () => Get.toNamed(AppRoutes.complexRanking),
          child: Container(
            padding: const EdgeInsets.only(top: 16, left: 16, bottom: 10),
            child: Row(
              children: [
                const Icon(
                  Icons.volume_down,
                  size: 20,
                  color: ColorHandler.globalGreenColor,
                ),
                GapHandler.hGap3,
                Text(
                  S.of(context).userPointsRanking,
                  style: TextStyleHandler.styleGrey13,
                )
              ],
            ),
          ),
        ),

        // 个人信息
        IconTitleWidget(
          icon: Icons.perm_identity,
          text: S.of(context).homeUserInfo,
          endColor: Colors.black54,
          onTap: () => NavigatorUtil.gotoNamed(AppRoutes.personalInfo),
        ),

        // 关于
        IconTitleWidget(
          icon: Icons.info_outline,
          text: S.of(context).homeAbout,
          endColor: Colors.black54,
          onTap: () => Get.toNamed(AppRoutes.about),
        ),

        // 分享
        IconTitleWidget(
          icon: Icons.share,
          text: S.of(context).homeShare,
          endColor: Colors.black45,
          onTap: () => Get.dialog(
              const ShareDialogWidget(url: ConstHandler.downloadUrl)),
        ),

        // 问题反馈
        IconTitleWidget(
          icon: Icons.feedback_outlined,
          text: S.of(context).homeFeedback,
          endColor: Colors.black45,
          onTap: () => Get.toNamed(AppRoutes.feedback),
        )
      ]),
    );
  }
}
