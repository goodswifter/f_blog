import 'package:blog/core/app/app_theme.dart';
import 'package:blog/utils/locale_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'core/router/app_pages.dart';
import 'pages/splash_page/splash_binding.dart';
import 'pages/splash_page/splash_page.dart';
import 'utils/injection_util.dart';
import 'utils/keyboard_util.dart';
import 'utils/toast_util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InjectionUtil.init();
  runApp(const MyApp());
  ToastUtil.init();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: AppRoutes.initial,
      unknownRoute: AppPages.unknownPage,
      getPages: AppPages.pages,
      theme: appThemeData, // 主题
      supportedLocales: LocaleUtil.supportedLocales, // 国际化支持的语言
      localizationsDelegates: LocaleUtil.localizationsDelegates,
      locale: LocaleUtil.currentLocale, // 当前语言
      fallbackLocale: LocaleUtil.fallbackLocale, // 备用语言
      defaultTransition: Transition.fade, // 默认的过渡动画
      initialBinding: SplashBinding(),
      home: const SplashPage(),
      builder: EasyLoading.init(
        builder: (context, child) => Scaffold(
          body: GestureDetector(
            onTap: () => KeyboardUtil.hideKeyboard(context),
            child: child,
          ),
        ),
      ),
    );
  }
}
