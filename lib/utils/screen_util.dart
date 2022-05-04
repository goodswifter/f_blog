///
/// Author       : zhongaidong
/// Date         : 2022-04-23 18:18:20
/// Description  : 屏幕工具类
///
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScreenUtil {
  /// 去除状态栏半透明
  static removeSystemTransparent(BuildContext context) {
    // android 平台
    if (Theme.of(context).platform == TargetPlatform.android) {
      SystemUiOverlayStyle _style = const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      );
      SystemChrome.setSystemUIOverlayStyle(_style);
    }
  }
}
