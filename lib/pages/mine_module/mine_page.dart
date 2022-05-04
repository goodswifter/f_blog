///
/// Author       : zhongaidong
/// Date         : 2022-04-21 10:40:41
/// Description  : 综合页面
///
import 'package:blog/core/base/pages/get_save_state_view.dart';
import 'package:blog/core/resource/color_handler.dart';
import 'package:blog/core/resource/gap_handler.dart';
import 'package:blog/pages/mine_module/mine_controller.dart';
import 'package:blog/pages/mine_module/widget/mine_data_widget.dart';
import 'package:blog/pages/mine_module/widget/mine_header_widget.dart';
import 'package:blog/pages/mine_module/widget/mine_list_view_widget.dart';
import 'package:flutter/material.dart';

class MinePage extends GetSaveStateView<MineController> {
  const MinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorHandler.backgroundColor,
        body: Column(
          children: const [
            GapHandler.vGap5,
            MineHeaderWidget(),
            MineDataWidget(),
            MineListViewWidget(),
          ],
        ),
      ),
    );
  }
}
