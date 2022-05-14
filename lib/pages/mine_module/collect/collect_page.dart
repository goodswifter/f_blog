///
/// Author       : zhongaidong
/// Date         : 2022-04-26 22:02:29
/// Description  : 收藏页面 view层
///
import 'package:blog/core/base/pages/get_common_view.dart';
import 'package:blog/core/resource/divider_handler.dart';
import 'package:blog/generated/l10n.dart';
import 'package:blog/pages/mine_module/collect/collect_item.dart';
import 'package:blog/widgets/custom_app_bar.dart';
import 'package:blog/widgets/refresh_widget.dart';
import 'package:flutter/material.dart';

import 'collect_controller.dart';

class CollectPage extends GetCommonView<CollectController> {
  const CollectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: S.of(context).collectTitle),
          DividerHandler.divider1HalfPadding20,
          Expanded(
            child: RefreshWidget<CollectController>(
                child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: controller.datas.length,
              itemBuilder: (BuildContext context, int index) {
                return CollectItem(
                  collect: controller.datas[index],
                  result: () => controller.notifyPart(index),
                );
              },
            )),
          ),
        ],
      ),
    );
  }
}
