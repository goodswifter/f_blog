///
/// Author       : zhongaidong
/// Date         : 2022-04-22 21:41:21
/// Description  : 综合-问答
///
import 'package:blog/core/base/pages/get_save_state_view.dart';
import 'package:blog/core/resource/divider_handler.dart';
import 'package:blog/utils/web_util.dart';
import 'package:blog/widgets/refresh_widget.dart';
import 'package:blog/widgets/ripple_widget.dart';
import 'package:flutter/material.dart';

import 'ask_controller.dart';
import 'widget/ask_article_item.dart';

class AskPage extends GetSaveStateView<AskController> {
  const AskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List projectDatas = controller.datas;
    return Scaffold(
      body: RefreshWidget<AskController>(
        child: ListView.separated(
          itemCount: projectDatas.length,
          separatorBuilder: (_, __) => DividerHandler.divider1Half,
          itemBuilder: (_, index) => Ripple(
            onTap: () =>
                WebUtil.toWebPage(controller.datas[index], onResult: (value) {
              controller.datas[index].collect = value;
            }),
            child: AskArticleItem(item: projectDatas[index]),
          ),
        ),
      ),
    );
  }
}
