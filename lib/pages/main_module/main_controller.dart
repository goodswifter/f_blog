///
/// Author       : zhongaidong
/// Date         : 2022-05-09 10:29:21
/// Description  : 主模块 - controller层
///
import 'package:blog/core/base/controller/base_get_controller.dart';

import '../complex_module/complex_page/complex_page.dart';
import '../mine_module/mine_page.dart';
import '../project_module/project_page.dart';
import 'lazy_indexed_stack.dart';

class MainController extends BaseGetController {
  final bodyList = [
    LazyStackChild(child: const ComplexPage()),
    LazyStackChild(child: const ProjectPage()),
    LazyStackChild(child: const MinePage(), preload: true),
  ];

  int currentIndex = 0;

  void onTap(int index) {
    currentIndex = index;
    update();
  }
}
