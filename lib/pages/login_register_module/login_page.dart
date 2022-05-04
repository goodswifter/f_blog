///
/// Author       : zhongaidong
/// Date         : 2022-04-23 18:34:44
/// Description  : 登录 view层
///
import 'package:blog/core/base/pages/get_common_view.dart';
import 'package:blog/core/resource/button_style_handler.dart';
import 'package:blog/core/resource/color_handler.dart';
import 'package:blog/core/resource/r.dart';
import 'package:blog/core/resource/text_style_handler.dart';
import 'package:blog/core/router/app_routes.dart';
import 'package:blog/generated/l10n.dart';
import 'package:blog/pages/login_register_module/login_controller.dart';
import 'package:blog/pages/login_register_module/widget/text_field_widget.dart';
import 'package:blog/utils/keyboard_util.dart';
import 'package:blog/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widget/logo_name_widget.dart';

class LoginPage extends GetCommonView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(R.assetsImagesBgLoginPng), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            const CustomAppBar(
              isShowBack: false,
              backgroundColor: Colors.transparent,
              // backOnTap: () => debugPrint('hh'),
            ),

            // logo及app名称
            const LogoNameWidget(),
            // 账户名输入框
            TextFieldWidget(
              iconWidget: const Icon(
                Icons.perm_identity,
                color: Colors.white,
              ),
              hintText: S.of(context).loginAccountNameHint,
              onChanged: (text) {
                print(text);
                controller
                  ..account = text
                  ..update();
              },
            ),

            // 密码输入框
            TextFieldWidget(
              iconWidget: const Icon(Icons.lock_open, color: Colors.white),
              hintText: S.of(context).loginAccountPwdHint,
              passwordType: true,
              onChanged: (text) => controller
                ..password = text
                ..update(),
            ),

            // 登录按钮
            Container(
              width: double.infinity,
              height: 50,
              margin: const EdgeInsets.only(top: 36, left: 25, right: 25),
              child: TextButton(
                style: controller.isButtonEnable()
                    ? ButtonStyleHandler.getButtonStyle()
                    : ButtonStyleHandler.getTransparentStyle(),
                onPressed: () {
                  KeyboardUtil.hideKeyboard(context);
                  controller.login();
                },
                child: Text(
                  S.of(context).loginButton,
                  style: controller.isButtonEnable()
                      ? TextStyleHandler.styleWhite18
                      : TextStyleHandler.styleWhite24Font18,
                ),
              ),
              decoration: BoxDecoration(
                color: controller.isButtonEnable()
                    ? ColorHandler.globalGreenColor
                    : ColorHandler.globalDarkGreenColor,
                borderRadius: const BorderRadius.all(Radius.circular(30)),
              ),
            ),

            // 注册按钮
            Container(
              width: double.infinity,
              height: 50,
              margin: const EdgeInsets.only(top: 16, left: 25, right: 25),
              child: TextButton(
                  style: ButtonStyleHandler.getButtonStyle(),
                  onPressed: () {
                    KeyboardUtil.hideKeyboard(context);
                    Get.toNamed(AppRoutes.register);
                  },
                  child: Text(
                    S.of(context).registerButton,
                    style: TextStyleHandler.styleWhite18,
                  )),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                border: Border.all(color: Colors.white, width: 1),
              ),
            )
          ],
        ),
      ),
    );
  }
}
