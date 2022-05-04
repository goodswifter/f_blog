///
/// Author       : zhongaidong
/// Date         : 2022-04-22 21:41:36
/// Description  : 综合-广场 view层
///
import 'package:blog/core/base/pages/get_save_state_view.dart';
import 'package:blog/core/resource/divider_handler.dart';
import 'package:blog/pages/complex_module/02_square_page/widget/square_article_item.dart';
import 'package:blog/utils/web_util.dart';
import 'package:blog/widgets/refresh_widget.dart';
import 'package:blog/widgets/ripple_widget.dart';
import 'package:flutter/material.dart';

import 'square_controller.dart';

class SquarePage extends GetSaveStateView<SquareController> {
  const SquarePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshWidget<SquareController>(
        child: ListView.separated(
          itemCount: controller.datas.length,
          separatorBuilder: (_, __) => DividerHandler.divider1Half,
          itemBuilder: (_, index) => Ripple(
            onTap: () => WebUtil.toWebPage(controller.datas[index],
                onResult: (value) {
              controller.datas[index].collect = value;
            }),
            child: SquareArticleItem(item: controller.datas[index]),
          ),
        ),
      ),
    );
  }
}
