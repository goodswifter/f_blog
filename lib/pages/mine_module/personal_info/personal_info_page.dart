///
/// Author       : zhongaidong
/// Date         : 2022-04-26 22:02:29
/// Description  : 个人信息 view层
///
import 'package:blog/core/base/pages/get_common_view.dart';
import 'package:blog/core/resource/divider_handler.dart';
import 'package:blog/core/resource/gap_handler.dart';
import 'package:blog/core/resource/shadow_handler.dart';
import 'package:blog/core/resource/text_style_handler.dart';
import 'package:blog/generated/l10n.dart';
import 'package:blog/pages/mine_module/personal_info/personal_info_controller.dart';
import 'package:blog/widgets/head_circle_widget.dart';
import 'package:blog/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalInfoPage extends GetCommonView<PersonalInfoController> {
  const PersonalInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
              title: S.of(context).homeUserInfo, backOnTap: () => Get.back()),
          // 头像
          Container(
            margin: const EdgeInsets.only(top: 24),
            child: const HeadCircleWidget(size: 72),
            decoration: ShadowHandler.black12Circle40(),
          ),
          GapHandler.vGap20,

          ListTile(
            title: Text(
              S.of(context).userNickname,
              style: TextStyleHandler.styleBlack15,
            ),
            trailing: Text(controller.userinfo!.nickname),
          ),

          DividerHandler.divider1HalfPadding20,
        ],
      ),
    );
  }
}
