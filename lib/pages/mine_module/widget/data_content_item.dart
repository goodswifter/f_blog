///
/// Author       : zhongaidong
/// Date         : 2022-04-29 22:50:15
/// Description  : 顶部数据，底部描述 按钮
///
import 'package:blog/core/resource/text_style_handler.dart';
import 'package:flutter/material.dart';

class DataContentItem extends StatelessWidget {
  const DataContentItem({
    Key? key,
    this.title = '',
    this.content = '',
    this.onTap,
  }) : super(key: key);

  /// 标题
  final String title;

  /// 内容
  final String content;

  /// 点击事件
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Text(content, style: TextStyleHandler.styleBlack18Bold),
            Container(
              padding: const EdgeInsets.only(top: 5),
              child: Text(title, style: TextStyleHandler.styleGrey2Font14),
            )
          ],
        ),
      ),
    );
  }
}
