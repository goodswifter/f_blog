///
/// Author       : zhongaidong
/// Date         : 2022-04-26 22:02:29
/// Description  : 积分页面 view层
///
import 'package:blog/core/base/pages/get_common_view.dart';
import 'package:blog/core/resource/divider_handler.dart';
import 'package:blog/generated/l10n.dart';
import 'package:blog/widgets/custom_app_bar.dart';
import 'package:blog/widgets/refresh_widget.dart';
import 'package:flutter/material.dart';

import 'point_controller.dart';
import 'point_item_widget.dart';

class PointPage extends GetCommonView<PointController> {
  const PointPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: S.of(context).pointsDetailTitle),
          DividerHandler.divider1HalfPadding20,
          // 积分列表
          Expanded(
            child: RefreshWidget<PointController>(
                child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: controller.datas.length,
              itemBuilder: (BuildContext context, int index) {
                return PointItemWidget(points: controller.datas[index]);
              },
            )),
          ),
        ],
      ),
    );
  }
}
