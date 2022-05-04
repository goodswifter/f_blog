///
/// Author       : zhongaidong
/// Date         : 2022-04-27 11:57:17
/// Description  : 搜索历史Item
///
import 'package:blog/core/resource/decoration_handler.dart';
import 'package:blog/core/resource/text_style_handler.dart';
import 'package:flutter/material.dart';

class SearchHistoryItem extends StatelessWidget {
  const SearchHistoryItem({Key? key, this.name = '', this.onTap})
      : super(key: key);

  final String name;

  /// 点击事件
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        margin: const EdgeInsets.all(4),
        decoration: DecorationHandler.shadow(),
        child: Text(
          name,
          style: TextStyleHandler.styleBlack13,
          maxLines: 10,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
