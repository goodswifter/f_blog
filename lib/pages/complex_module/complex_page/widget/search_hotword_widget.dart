///
/// Author       : zhongaidong
/// Date         : 2022-04-27 18:20:58
/// Description  : 搜索页面 搜索热词Widget
///
import 'package:blog/core/base/pages/get_common_view.dart';
import 'package:blog/core/resource/gap_handler.dart';
import 'package:blog/core/resource/r.dart';
import 'package:blog/core/resource/text_style_handler.dart';
import 'package:blog/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../serach_page/search_controller.dart';
import 'search_hotword_item.dart';

class SearchHotWordWidget extends GetCommonView<SearchController> {
  const SearchHotWordWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GapHandler.hGap20,
            Text(
              S.of(context).searchHotWord,
              style: TextStyleHandler.styleBlack16Bold500,
            ),
            SvgPicture.asset(
              R.assetsSvgHotwordSvg,
              width: 16,
            ),
            GapHandler.hGap20,
            Expanded(child: Container()),
          ],
        ),
        GapHandler.vGap5,
        Obx(() => Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: controller.hotWord.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 5 / 1),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () => controller
                        .hotOrHistorySearch(controller.hotWord[index].name),
                    child: SearchHotWordItem(
                      item: controller.hotWord[index],
                      index: index + 1,
                    ),
                  );
                },
              ),
            )),
      ],
    );
  }
}
