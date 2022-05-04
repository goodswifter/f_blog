///
/// Author       : zhongaidong
/// Date         : 2022-04-27 11:44:51
/// Description  : 搜索历史记录Widget
///
import 'package:blog/core/base/pages/get_common_view.dart';
import 'package:blog/core/resource/gap_handler.dart';
import 'package:blog/core/resource/r.dart';
import 'package:blog/core/resource/text_style_handler.dart';
import 'package:blog/generated/l10n.dart';
import 'package:blog/widgets/ripple_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../serach_page/search_controller.dart';
import 'search_history_item.dart';

class SearchHistoryWidget extends GetCommonView<SearchController> {
  const SearchHistoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Visibility(
        visible: controller.history.isNotEmpty,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GapHandler.hGap20,
                Text(
                  S.of(context).searchHistory,
                  style: TextStyleHandler.styleBlack16Bold500,
                ),
                Expanded(child: Container()),
                Ripple(
                  onTap: () => controller.clearSearchHistory(),
                  circular: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: SvgPicture.asset(
                      R.assetsSvgRubbishSvg,
                      width: 24,
                    ),
                  ),
                ),
                GapHandler.hGap20,
              ],
            ),
            GapHandler.vGap5,
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Wrap(
                children: [
                  for (String items in controller.history)
                    SearchHistoryItem(
                      name: items,
                      // 改变输入框内容、设置输入框文本、光标移动到尾部、开始搜索数据
                      onTap: () => controller.hotOrHistorySearch(items),
                    )
                ],
                crossAxisAlignment: WrapCrossAlignment.center,
              ),
            )
          ],
        )));
  }
}
