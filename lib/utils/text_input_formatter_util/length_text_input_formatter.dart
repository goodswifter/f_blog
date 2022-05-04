/// 
/// Author       : zhongaidong
/// Date         : 2022-04-23 19:20:54
/// Description  : 有长度限制的文本输入样式
/// 兼容中文拼音输入法
/// 
import 'package:flutter/services.dart';

class LengthTextInputFormatter extends TextInputFormatter {

  LengthTextInputFormatter({this.maxLength}) : assert(maxLength != null);
  final int? maxLength;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final int max = maxLength ?? 0;
    TextSelection newSelection = newValue.selection;
    // If this is a multiline TextField, return as is.
    if (max < newValue.text.length) {
      newValue = TextEditingValue(
        text: newValue.text.substring(0, max),
        selection: newSelection,
      );
    }
    return newValue;
  }
}