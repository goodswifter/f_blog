///
/// Author       : zhongaidong
/// Date         : 2022-04-29 10:48:54
/// Description  : 广场文章item
///
import 'package:blog/core/resource/gap_handler.dart';
import 'package:blog/core/resource/text_style_handler.dart';
import 'package:blog/entity/article_entity.dart';
import 'package:blog/widgets/head_circle_widget.dart';
import 'package:flutter/material.dart';

class AskArticleItem extends StatelessWidget {
  const AskArticleItem({Key? key, required this.item}) : super(key: key);

  /// 文章Item
  final ArticleEntity item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyleHandler.styleBlack16Bold,
          ),
          GapHandler.vGap10,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const HeadCircleWidget(size: 22),
              GapHandler.hGap5,
              Text(
                item.shareUser.isEmpty ? item.author : item.shareUser,
                style: TextStyleHandler.styleGrey4Font11,
              ),
              GapHandler.hGap10,
              Text(item.niceDate, style: TextStyleHandler.styleGrey4Font11),
            ],
          ),
        ],
      ),
    );
  }
}
