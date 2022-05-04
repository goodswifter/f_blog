///
/// Author       : zhongaidong
/// Date         : 2022-05-02 19:28:51
/// Description  : 浏览历史 item
///
import 'package:blog/core/resource/color_handler.dart';
import 'package:blog/core/resource/gap_handler.dart';
import 'package:blog/core/resource/text_style_handler.dart';
import 'package:blog/entity/article_entity.dart';
import 'package:blog/utils/web_util.dart';
import 'package:flutter/material.dart';

class HistoryShareItemWidget extends StatelessWidget {
  const HistoryShareItemWidget({
    Key? key,
    required this.detail,
    required this.onResult,
  }) : super(key: key);

  /// 文章详情
  final ArticleEntity detail;

  final Function(bool)? onResult;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => WebUtil.toWebPage(detail, onResult: onResult),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 0.5, color: ColorHandler.whiteColor4)),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    detail.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyleHandler.styleBlack16Bold,
                  ),
                  GapHandler.vGap10,
                  Visibility(
                    visible: detail.desc.isNotEmpty,
                    child: Text(
                      detail.desc,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyleHandler.styleGrey4Font14,
                    ),
                  ),
                  GapHandler.vGap5,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        detail.superChapterName,
                        style: TextStyleHandler.styleTangerine11,
                      ),
                      GapHandler.hGap10,
                      const Text(
                        '|',
                        style: TextStyleHandler.styleGrey4Font11,
                      ),
                      GapHandler.hGap10,
                      Text(
                        detail.shareUser.isEmpty
                            ? detail.author
                            : detail.shareUser,
                        style: TextStyleHandler.styleGrey4Font11,
                      ),
                      GapHandler.hGap10,
                      Text(detail.niceDate,
                          style: TextStyleHandler.styleGrey4Font11),
                    ],
                  ),
                  GapHandler.vGap3,
                ],
              ),
            ),
            GapHandler.hGap5,
            Visibility(
              visible: detail.envelopePic.isNotEmpty,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  detail.envelopePic,
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
