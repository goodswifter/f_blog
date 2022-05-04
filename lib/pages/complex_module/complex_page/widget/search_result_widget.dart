///
/// Author       : zhongaidong
/// Date         : 2022-04-27 15:34:54
/// Description  : 搜索页面 搜索结果Widget
///
import 'package:blog/core/base/pages/get_common_view.dart';
import 'package:blog/utils/web_util.dart';
import 'package:blog/widgets/refresh_widget.dart';
import 'package:blog/widgets/ripple_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../serach_page/search_controller.dart';
import 'search_result_item.dart';

class SearchResultWidget extends GetCommonView<SearchController> {
  const SearchResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Visibility(
          visible: controller.isShowSearchResult.value,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            color: Colors.white,
            child: RefreshWidget<SearchController>(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: controller.datas.length,
                itemBuilder: (BuildContext context, int index) {
                  return Material(
                    color: Colors.transparent,
                    child: Ripple(
                      onTap: () => WebUtil.toWebPage(
                          controller.datas[index], onResult: (value) {
                        controller.datas[index].collect = value;
                      }),
                      child: SearchResultItem(
                          item: controller.datas[index]),
                    ),
                  );
                },
              ),
            ),
          ),
        ));
  }
}
