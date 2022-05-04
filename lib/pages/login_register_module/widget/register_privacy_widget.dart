///
/// Author       : zhongaidong
/// Date         : 2022-04-23 23:29:31
/// Description  : 注册 用户服务条款
///
import 'package:blog/core/base/pages/get_common_view.dart';
import 'package:blog/core/resource/color_handler.dart';
import 'package:blog/core/resource/text_style_handler.dart';
import 'package:blog/generated/l10n.dart';
import 'package:blog/pages/login_register_module/register_controller.dart';
import 'package:flutter/material.dart';

class RegisterPrivacyWidget extends GetCommonView<RegisterController> {
  const RegisterPrivacyWidget({Key? key}) : super(key: key);

  @override
  get updateId => "isCheckPrivacy";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16),
      child: Row(
        children: [
          Checkbox(
              value: controller.isCheckPrivacy,
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.all(ColorHandler.globalGreenColor),
              onChanged: (select) {
                controller.updateCheck();
              }),
          Text(
            S.of(context).registerServiceTerms,
            style: TextStyleHandler.styleWhite14,
          )
        ],
      ),
    );
  }
}
