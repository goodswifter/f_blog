///
/// Author       : zhongaidong
/// Date         : 2022-04-26 22:02:29
/// Description  : 历史页面 view层
///
import 'package:blog/core/base/pages/get_common_view.dart';
import 'package:blog/core/resource/divider_handler.dart';
import 'package:blog/generated/l10n.dart';
import 'package:blog/pages/mine_module/history/history_controller.dart';
import 'package:blog/widgets/custom_app_bar.dart';
import 'package:blog/widgets/refresh_widget.dart';
import 'package:flutter/material.dart';

import '../widget/history_share_item_widget.dart';

class HistoryPage extends GetCommonView<HistoryController> {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: S.of(context).historyTitle),
          DividerHandler.divider1HalfPadding20,
          // 浏览历史
          Expanded(
            child: RefreshWidget<HistoryController>(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: controller.datas.length,
                itemBuilder: (BuildContext context, int index) {
                  return HistoryShareItemWidget(
                    detail: controller.datas[index],
                    onResult: (value) =>
                        controller.datas[index].collect = value,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
