///
/// Author       : zhongaidong
/// Date         : 2022-04-26 22:02:29
/// Description  : 设置页面 view层
///
import 'package:blog/core/base/pages/get_common_view.dart';
import 'package:blog/core/resource/divider_handler.dart';
import 'package:blog/core/resource/text_style_handler.dart';
import 'package:blog/core/router/app_routes.dart';
import 'package:blog/generated/l10n.dart';
import 'package:blog/pages/mine_module/setting/setting_controller.dart';
import 'package:blog/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingPage extends GetCommonView<SettingController> {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: S.of(context).settingTitle),
          DividerHandler.divider1Half,
          ListTile(
            onTap: () => Get.toNamed(AppRoutes.settingLanguage),
            title: Text(S.of(context).settingLanguage),
            trailing: const Icon(Icons.keyboard_arrow_right),
          ),
          ListTile(
            onTap: () => controller.clearCacheFile(),
            title: Text(S.of(context).settingCache),
            trailing: Obx(() => Text(
                  controller.cache.value,
                  style: TextStyleHandler.styleGrey2Font14,
                )),
          ),
          DividerHandler.divider20Half,
          ListTile(
            onTap: () => controller.exitLoginState(),
            title: Container(
              alignment: Alignment.center,
              child: Text(S.of(context).settingExitLogin),
            ),
          ),
        ],
      ),
    );
  }
}
