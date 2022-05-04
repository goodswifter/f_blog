///
/// Author       : zhongaidong
/// Date         : 2022-04-29 22:36:43
/// Description  : 我的 头部Widget
///
import 'package:blog/core/base/pages/get_save_state_view.dart';
import 'package:blog/core/resource/shadow_handler.dart';
import 'package:blog/core/resource/text_style_handler.dart';
import 'package:blog/core/router/app_routes.dart';
import 'package:blog/generated/l10n.dart';
import 'package:blog/pages/mine_module/mine_controller.dart';
import 'package:blog/widgets/head_circle_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MineHeaderWidget extends GetSaveStateView<MineController> {
  const MineHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.userinfo != null
          ? Get.toNamed(AppRoutes.personalInfo)
          : Get.toNamed(AppRoutes.login),
      child: Row(
        children: [
          // 头像
          Container(
            margin: const EdgeInsets.only(left: 24),
            child: const HeadCircleWidget(size: 72),
            decoration: ShadowHandler.black12Circle40(),
          ),

          // 用户名称
          Container(
            margin: const EdgeInsets.only(left: 16),
            child: Text(
              controller.userinfo?.nickname ?? S.of(context).TapTologin,
              style: TextStyleHandler.styleDarkBlue18,
            ),
          ),
          // 占位Expanded控件
          const Expanded(child: SizedBox()),
          // 设置
          GestureDetector(
            onTap: () => Get.toNamed(AppRoutes.setting),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              child: Container(
                color: Colors.grey[300],
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: const Icon(Icons.settings),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
