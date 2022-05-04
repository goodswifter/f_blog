///
/// Author       : zhongaidong
/// Date         : 2022-04-29 10:48:54
/// Description  : 广场文章item
///
import 'package:blog/core/resource/decoration_handler.dart';
import 'package:blog/core/resource/gap_handler.dart';
import 'package:blog/core/resource/text_style_handler.dart';
import 'package:blog/entity/article_entity.dart';
import 'package:flutter/material.dart';

class SquareArticleItem extends StatelessWidget {
  const SquareArticleItem({Key? key, required this.item}) : super(key: key);

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
              Visibility(
                visible: item.fresh,
                child: Container(
                  margin: const EdgeInsets.only(top: 0, right: 12),
                  padding: const EdgeInsets.only(
                      top: 4, left: 2, right: 2, bottom: 2),
                  decoration: DecorationHandler.custom(
                    border: 1.5,
                    borderColor: Colors.red,
                    radius: 3,
                  ),
                  child: const Text('新', style: TextStyleHandler.styleRed10),
                ),
              ),
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
