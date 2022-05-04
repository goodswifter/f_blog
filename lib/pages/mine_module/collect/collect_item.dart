///
/// Author       : zhongaidong
/// Date         : 2022-05-02 00:17:39
/// Description  : 收藏 item
///
import 'package:blog/core/resource/color_handler.dart';
import 'package:blog/core/resource/gap_handler.dart';
import 'package:blog/core/resource/text_style_handler.dart';
import 'package:blog/entity/collect_article_entity.dart';
import 'package:blog/utils/web_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class CollectItem extends StatelessWidget {
  /// 收藏信息
  final CollectArticleEntity collect;

  final GestureTapCallback? result;

  const CollectItem({Key? key, required this.collect, this.result})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => WebUtil.toWebPageCollect(collect)?.then((value) {
        /// 参数类型正确并且取消收藏了
        if (value is bool && !value && result != null) {
          result!();
        }
      }),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
            border: Border(
                bottom:
                    BorderSide(width: 0.5, color: ColorHandler.whiteColor4))),
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 5),
                        decoration: const BoxDecoration(
                          color: ColorHandler.globalTangerineColor,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        child: Text(
                          collect.chapterName,
                          style: TextStyleHandler.styleWhite12,
                        ),
                      ),
                      GapHandler.hGap5,
                      Expanded(
                        child: Text(
                          collect.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyleHandler.styleBlack16Bold,
                        ),
                      )
                    ],
                  ),
                  GapHandler.vGap10,
                  Visibility(
                      visible: collect.desc.isNotEmpty,
                      child: SizedBox(
                        height: collect.desc.isNotEmpty ? 80 : 0,
                        child: Html(data: collect.desc),
                      )),
                  GapHandler.vGap10,
                  Row(
                    children: [
                      Text(
                        collect.author,
                        style: TextStyleHandler.styleGrey14,
                      ),
                      GapHandler.hGap10,
                      Expanded(
                        child: Text(
                          collect.niceDate,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyleHandler.styleOrange14,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            GapHandler.hGap5,
            Visibility(
              visible: collect.envelopePic.isNotEmpty,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  collect.envelopePic,
                  fit: BoxFit.cover,
                  width: 72,
                  height: 72,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
