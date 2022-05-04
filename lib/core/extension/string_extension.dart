///
/// Author       : zhongaidong
/// Date         : 2022-04-25 18:34:43
/// Description  : 字符串扩展类
///
import 'package:intl/intl.dart';

extension StringExtension on String {
  /// 返回本地语言对应的字符串
  String get intl => Intl.message(this);
}
