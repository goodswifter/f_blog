///
/// Author       : zhongaidong
/// Date         : 2022-04-21 10:06:02
/// Description  :
///

abstract class AppRoutes {
  // ------------------- Main -------------------
  static const String initial = '/main';
  static const String splash = "/splash";
  static const String unknown = "/unknown";

  // ------------------- Login Register -------------------
  static const String login = "/login";
  static const String register = "/register";

  // ------------------- Complex -------------------
  /// 综合模块
  // static const String complex = "/complex";

  /// 排行榜
  static const String complexRanking = "/complex/ranking";

  /// 首页 - 搜索
  static const String complexSearch = "/complex/home/search";

  // ------------------- Mine -------------------
  /// 个人信息页面
  static const String personalInfo = "/mine/personalInfo";

  /// 设置页面
  static const String setting = "/mine/setting";
  static const String settingLanguage = "/mine/setting/language";

  /// 收藏页面
  static const String collect = "/mine/collect";

  /// 分享页面
  static const String share = '/mine/share';

  /// 积分排行榜页面
  static const String point = '/mine/points';

  /// 历史记录页面
  static const String history = '/mine/history';

  /// 关于页面
  static const String about = '/mine/about';

  /// 反馈页面
  static const String feedback = '/mine/feedback';

  // ------------------- Other -------------------
  /// webview
  static const String webview = '/webview';
}
