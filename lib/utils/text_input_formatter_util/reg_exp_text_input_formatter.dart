///
/// Author       : zhongaidong
/// Date         : 2022-04-23 19:26:20
/// Description  : 可正则匹配的文本输入样式
/// 兼容中文拼音输入法校验
///
import 'package:flutter/services.dart';

class RegExpTextInputFormatter extends TextInputFormatter {
  RegExpTextInputFormatter({required this.filterPattern});

  /// 过滤样式
  final Pattern filterPattern;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.isComposingRangeValid) return newValue;
    return FilteringTextInputFormatter.allow(filterPattern)
        .formatEditUpdate(oldValue, newValue);
  }
}
