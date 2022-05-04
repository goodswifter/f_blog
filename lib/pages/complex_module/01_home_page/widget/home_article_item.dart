///
/// Author       : zhongaidong
/// Date         : 2022-04-26 17:57:13
/// Description  : 搜索页面 搜索结果列表Item
///
import 'package:blog/core/resource/decoration_handler.dart';
import 'package:blog/core/resource/divider_handler.dart';
import 'package:blog/core/resource/gap_handler.dart';
import 'package:blog/core/resource/text_style_handler.dart';
import 'package:blog/entity/article_entity.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';

class HomeArticleItem extends StatelessWidget {
  /// 列表数据
  final ArticleEntity item;

  final int index;

  const HomeArticleItem({Key? key, required this.item, this.index = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String desc = parse(item.desc).body?.text ?? '';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GapHandler.vGap10,
          Stack(
            children: [
              Text(
                getPaddingText(item.title),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyleHandler.styleBlack16Bold,
              ),
              Visibility(
                visible: index <= 2,
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 4, left: 2, right: 2, bottom: 2),
                  decoration: DecorationHandler.custom(
                      borderColor: Colors.red, radius: 3, border: 1.5),
                  child: const Text('荐', style: TextStyleHandler.styleRed10),
                ),
              ),
            ],
          ),
          Visibility(
            visible: item.desc.isNotEmpty,
            child: Text(
              desc,
              style: TextStyleHandler.styleGrey2Font14,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          GapHandler.vGap10,
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                item.superChapterName,
                style: TextStyleHandler.styleTangerine11,
              ),
              GapHandler.hGap10,
              const Text(
                '|',
                style: TextStyleHandler.styleGrey4Font11,
              ),
              GapHandler.hGap10,
              Text(
                item.shareUser.isEmpty ? item.author : item.shareUser,
                style: TextStyleHandler.styleGrey4Font11,
              ),
              GapHandler.hGap10,
              Text(item.niceDate, style: TextStyleHandler.styleGrey4Font11),
            ],
          ),
          GapHandler.vGap10,
          DividerHandler.divider1Half
        ],
      ),
    );
  }

  /// 获取第一行内部边距的Text
  /// [title] 标题
  String getPaddingText(String title) {
    return index <= 2 ? "      $title" : title;
  }
}
