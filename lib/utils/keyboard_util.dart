///
/// Author       : zhongaidong
/// Date         : 2022-04-18 10:51:51
/// Description  : 软键盘相关工具类
///
import 'package:flutter/material.dart';

class KeyboardUtil {
  /// 隐藏当前页面[context]的软键盘
  static hideKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}
