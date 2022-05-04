///
/// Author       : zhongaidong
/// Date         : 2022-04-26 22:02:29
/// Description  : 首页 - 搜索 view层
///
import 'package:blog/core/base/pages/get_common_view.dart';
import 'package:blog/core/resource/gap_handler.dart';
import 'package:blog/core/resource/text_style_handler.dart';
import 'package:blog/generated/l10n.dart';
import 'package:blog/pages/complex_module/complex_page/widget/search_input_widget.dart';
import 'package:flutter/material.dart';

import '../widget/search_history_widget.dart';
import '../widget/search_hotword_widget.dart';
import '../widget/search_result_widget.dart';
import 'search_controller.dart';

class SearchPage extends GetCommonView<SearchController> {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: SearchInputWidget(
          controller: controller.textController,
          onChanged: (text) {
            controller.changeText.value = text;
            if (text.isEmpty) {
              controller
                ..changeText.value = ''
                ..isShowSearchResult.value = false
                ..textController.text = ''
                ..clearSearchResults();
            }
          },
        ),
        actions: [
          GestureDetector(
            onTap: () => controller.searchArticles(),
            child: Container(
              alignment: Alignment.center,
              height: 30,
              width: 50,
              // padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Text(
                S.of(context).search,
                style: TextStyleHandler.styleDarkBlue14,
              ),
            ),
          ),
        ],
        elevation: 0,
      ),
      body: Stack(
        children: [
          Column(
            children: const [
              // 搜索历史
              SearchHistoryWidget(),
              GapHandler.vGap20,

              // 搜索热词
              SearchHotWordWidget(),
            ],
          ),
          const SearchResultWidget()
        ],
      ),
    );
  }
}
