///
/// Author       : zhongaidong
/// Date         : 2022-04-21 10:40:41
/// Description  : 综合页面
///
import 'package:blog/core/base/pages/get_save_state_view.dart';
import 'package:blog/core/resource/divider_handler.dart';
import 'package:blog/pages/project_module/project_controller.dart';
import 'package:blog/pages/project_module/widget/project_article_item.dart';
import 'package:blog/widgets/refresh_widget.dart';
import 'package:flutter/material.dart';

class ProjectPage extends GetSaveStateView<ProjectController> {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(controller.datas.length);
    return Scaffold(
      body: SafeArea(
        child: RefreshWidget<ProjectController>(
          child: ListView.separated(
            itemCount: controller.datas.length,
            separatorBuilder: (_, __) => DividerHandler.divider1Half,
            itemBuilder: (_, index) =>
                ProjectArticleItem(detail: controller.datas[index]),
          ),
        ),
      ),
    );
  }
}
