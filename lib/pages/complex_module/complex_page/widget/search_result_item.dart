///
/// Author       : zhongaidong
/// Date         : 2022-04-27 15:38:00
/// Description  : 搜索结果item
///
import 'package:blog/core/resource/decoration_handler.dart';
import 'package:blog/core/resource/gap_handler.dart';
import 'package:blog/core/resource/text_style_handler.dart';
import 'package:blog/entity/article_entity.dart';
import 'package:blog/utils/html_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class SearchResultItem extends StatelessWidget {
  const SearchResultItem({Key? key, required this.item}) : super(key: key);

  /// 列表数据
  final ArticleEntity item;

  @override
  Widget build(BuildContext context) {
    var content = HtmlUtil.html2Title(item.title);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: DecorationHandler.divider(),
      child: Column(
        children: [
          Html(
            data: content,
            style: {
              'font': Style(
                  fontSize: const FontSize(15), fontWeight: FontWeight.w700)
            },
          ),
          Visibility(
            visible: item.desc.isNotEmpty,
            child: Container(
                margin: const EdgeInsets.only(bottom: 6),
                child: Html(data: item.desc)),
          ),
          GapHandler.vGap3,
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GapHandler.hGap6,
              Text(
                item.superChapterName,
                style: TextStyleHandler.styleGrey5Font11,
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
          GapHandler.vGap3,
        ],
      ),
    );
  }
}
