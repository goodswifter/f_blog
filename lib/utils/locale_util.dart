///
/// Author       : zhongaidong
/// Date         : 2022-04-23 10:01:54
/// Description  : 本地化管理工具
///
import 'package:blog/entity/language_entity.dart';
import 'package:blog/generated/l10n.dart';
import 'package:blog/utils/sp_util/sp_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class LocaleUtil {
  /// 本地化代理
  static List<LocalizationsDelegate> localizationsDelegates = const [
    GlobalMaterialLocalizations.delegate, // 指定本地化的字符串和一些其他的值
    GlobalCupertinoLocalizations.delegate, // 对应的Cupertino风格
    GlobalWidgetsLocalizations.delegate, // 指定默认的文本排列方向, 由左到右或由右到左
    S.delegate, // 指定本地化的字符串和一些其他的值
    RefreshLocalizations.delegate,
  ];

  /// 支持的语言
  static List<Locale> supportedLocales = S.delegate.supportedLocales;

  /// 当前语言
  static Locale get currentLocale => _getDefault();

  /// 备用语言
  static Locale fallbackLocale = const Locale('zh', 'CN');

  /// 更新语言
  static updateLocale(LanguageEntity language) {
    Locale? locale;
    if (language.language == '' || language.country == '') {
      locale = Get.deviceLocale;
    } else {
      locale = Locale(language.language, language.country);
    }
    if (locale != null) {
      SpUtil.updateLanguage(language);
      Get.updateLocale(locale);
    }
  }

  /// 获取当前存储的默认语言
  static _getDefault() {
    var language = SpUtil.getLanguage();
    if (language == null || language.language == '' || language.country == '') {
      return Get.deviceLocale;
    } else {
      return Locale(language.language, language.country);
    }
  }
}
