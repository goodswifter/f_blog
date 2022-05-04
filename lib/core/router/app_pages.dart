///
/// Author       : zhongaidong
/// Date         : 2022-04-21 10:05:53
/// Description  : Get页面路由
///
import 'package:blog/pages/complex_module/01_home_page/ranking_page/ranking_binding.dart';
import 'package:blog/pages/complex_module/01_home_page/ranking_page/ranking_page.dart';
import 'package:blog/pages/complex_module/complex_page/serach_page/search_binding.dart';
import 'package:blog/pages/complex_module/complex_page/serach_page/search_page.dart';
import 'package:blog/pages/login_register_module/login_binding.dart';
import 'package:blog/pages/login_register_module/login_page.dart';
import 'package:blog/pages/login_register_module/register_binding.dart';
import 'package:blog/pages/login_register_module/register_page.dart';
import 'package:blog/pages/main_module/main_binding.dart';
import 'package:blog/pages/complex_module/complex_page/complex_page.dart';
import 'package:blog/pages/main_module/main_page.dart';
import 'package:blog/pages/mine_module/about/about_page.dart';
import 'package:blog/pages/mine_module/collect/collect_page.dart';
import 'package:blog/pages/mine_module/feedback/feedback_page.dart';
import 'package:blog/pages/mine_module/history/history_page.dart';
import 'package:blog/pages/mine_module/mine_binding.dart';
import 'package:blog/pages/mine_module/personal_info/personal_info_page.dart';
import 'package:blog/pages/mine_module/point/point_page.dart';
import 'package:blog/pages/mine_module/setting/setting_language_page.dart';
import 'package:blog/pages/mine_module/setting/setting_page.dart';
import 'package:blog/pages/mine_module/share/share_page.dart';
import 'package:blog/pages/other/unknown_page.dart';
import 'package:blog/pages/splash_page/splash_binding.dart';
import 'package:blog/pages/splash_page/splash_page.dart';
import 'package:blog/pages/webview_page/webview_binding.dart';
import 'package:blog/pages/webview_page/webview_page.dart';
import 'package:get/get.dart';

import 'app_routes.dart';

abstract class AppPages {
  static final List<GetPage> pages = [
    // ------------------- Main -------------------
    GetPage(
        name: AppRoutes.initial,
        page: () => const MainPage(),
        binding: MainBinding()),
    GetPage(name: AppRoutes.unknown, page: () => const UnknownPage()),
    GetPage(
        name: AppRoutes.splash,
        page: () => const SplashPage(),
        binding: SplashBinding(),
        fullscreenDialog: true),

    // ------------------- Login Register -------------------
    GetPage(
        name: AppRoutes.login,
        page: () => const LoginPage(),
        binding: LoginBinding()),
    GetPage(
        name: AppRoutes.register,
        page: () => const RegisterPage(),
        binding: RegisterBinding()),

    // ------------------- Complex -------------------
    // GetPage(name: AppRoutes.complex, page: () => const ComplexPage()),
    GetPage(
        name: AppRoutes.complexRanking,
        page: () => const RankingPage(),
        binding: RankingBinding()),
    GetPage(
      name: AppRoutes.complexSearch,
      page: () => const SearchPage(),
      binding: SearchBinding(),
    ),

    // ------------------- Mine -------------------
    GetPage(
      name: AppRoutes.personalInfo,
      page: () => const PersonalInfoPage(),
      binding: MineBinding(),
    ),
    GetPage(
      name: AppRoutes.setting,
      page: () => const SettingPage(),
      binding: MineBinding(),
    ),
    GetPage(
      name: AppRoutes.settingLanguage,
      page: () => const SettingLanguagePage(),
    ),
    GetPage(
      name: AppRoutes.collect,
      page: () => const CollectPage(),
      binding: MineBinding(),
    ),
    GetPage(
      name: AppRoutes.share,
      page: () => const SharePage(),
      binding: MineBinding(),
    ),
    GetPage(
      name: AppRoutes.point,
      page: () => const PointPage(),
      binding: MineBinding(),
    ),
    GetPage(
      name: AppRoutes.history,
      page: () => const HistoryPage(),
      binding: MineBinding(),
    ),
    GetPage(
      name: AppRoutes.about,
      page: () => const AboutPage(),
      binding: MineBinding(),
    ),
    GetPage(
      name: AppRoutes.feedback,
      page: () => const FeedbackPage(),
      binding: MineBinding(),
    ),

    // ------------------- Other -------------------
    GetPage(
        name: AppRoutes.webview,
        page: () => const WebviewPage(),
        binding: WebviewBinding()),
  ];

  static final GetPage unknownPage =
      GetPage(name: AppRoutes.unknown, page: () => const UnknownPage());
}
