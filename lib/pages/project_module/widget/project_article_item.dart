///
/// Author       : zhongaidong
/// Date         : 2022-04-29 21:42:21
/// Description  : 项目文章item
///
import 'package:blog/core/resource/color_handler.dart';
import 'package:blog/core/resource/gap_handler.dart';
import 'package:blog/core/resource/r.dart';
import 'package:blog/core/resource/text_style_handler.dart';
import 'package:blog/entity/article_entity.dart';
import 'package:blog/utils/web_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProjectArticleItem extends StatelessWidget {
  const ProjectArticleItem({Key? key, required this.detail, this.onResult}) : super(key: key);

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
          color: Colors.white,
          border: Border(
            bottom: BorderSide(width: 0.5, color: ColorHandler.whiteColor4),
          ),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 标题
                  Text(
                    detail.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyleHandler.styleBlack16Bold,
                  ),
                  GapHandler.vGap10,
                  // 部分内容
                  Text(
                    detail.desc,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: TextStyleHandler.styleGrey2Font14,
                  ),
                  GapHandler.vGap10,
                  // 作者
                  Row(
                    children: [
                      SvgPicture.asset(
                        R.assetsSvgProgramSvg,
                        width: 16,
                      ),
                      GapHandler.hGap10,
                      Text(
                        detail.author,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyleHandler.styleGrey2Font14,
                      )
                    ],
                  ),
                  GapHandler.vGap10,
                  // 发布时间
                  Row(
                    children: [
                      SvgPicture.asset(
                        R.assetsSvgDateTimeSvg,
                        width: 16,
                      ),
                      GapHandler.hGap10,
                      Text(
                        detail.niceDate,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyleHandler.styleGrey2Font14,
                      )
                    ],
                  )
                ],
              ),
            ),
            GapHandler.hGap5,
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                detail.envelopePic,
                fit: BoxFit.fill,
                width: 72,
                height: 128,
              ),
            )
          ],
        ),
      ),
    );
  }
}
