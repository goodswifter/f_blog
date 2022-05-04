///
/// Author       : zhongaidong
/// Date         : 2022-04-27 15:40:42
/// Description  : HTML工具类
///
import 'package:flutter/material.dart';

class HtmlUtil {
  static String html2Title(String html) {
    html = html.replaceAll('<em class=\'highlight\'>', '<font color="#f00">');
    html = html.replaceAll('</em>', '</font>');
    html = '<font color="#000">$html</font>';
    debugPrint("content=> $html");
    return html;
  }
}
