///
/// Author       : zhongaidong
/// Date         : 2022-04-23 18:22:31
/// Description  : 启动页动画Widget
///
import 'package:blog/core/base/pages/get_common_view.dart';
import 'package:blog/core/resource/r.dart';
import 'package:blog/core/resource/text_style_handler.dart';
import 'package:blog/core/router/app_routes.dart';
import 'package:blog/generated/l10n.dart';
import 'package:blog/pages/splash_page/splash_controller.dart';
import 'package:blog/utils/sp_util/sp_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashAnimateWidget extends GetCommonView<SplashController> {
  const SplashAnimateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: controller.opacity,
      duration: const Duration(milliseconds: 2000),
      onEnd: () {
        // Get.offNamed(
        //     SpUtil.getUserinfo() == null ? AppRoutes.login : AppRoutes.initial);
        Get.offNamed(AppRoutes.initial);
      },
      child: Container(
        margin: const EdgeInsets.only(top: 120),
        alignment: Alignment.center,
        child: Column(
          children: [
            Image.asset(
              R.assetsImagesApplicationIconPng,
              fit: BoxFit.fitWidth,
              width: 110,
              height: 110,
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Text(
                S.of(context).appName,
                // 'hh',
                style: TextStyleHandler.styleBlack36,
              ),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     Get.offNamed(AppRoutes.initial);
            //   },
            //   child: const Text('跳转到主页'),
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     SpUtil.deleteUserinfo();
            //     Get.offAllNamed(AppRoutes.login);
            //   },
            //   child: const Text('退出'),
            // ),
          ],
        ),
      ),
    );
  }
}
