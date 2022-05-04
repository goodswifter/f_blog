///
/// Author       : zhongaidong
/// Date         : 2022-04-21 10:40:41
/// Description  : 综合页面
///
import 'package:blog/core/resource/color_handler.dart';
import 'package:blog/core/resource/gap_handler.dart';
import 'package:blog/core/resource/r.dart';
import 'package:blog/core/resource/text_style_handler.dart';
import 'package:blog/core/router/app_routes.dart';
import 'package:blog/generated/l10n.dart';
import 'package:blog/pages/complex_module/01_home_page/home_page.dart';
import 'package:blog/pages/complex_module/02_square_page/square_page.dart';
import 'package:blog/pages/complex_module/03_ask_page/ask_page.dart';
import 'package:blog/widgets/ripple_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ComplexPage extends StatefulWidget {
  const ComplexPage({Key? key}) : super(key: key);

  @override
  State<ComplexPage> createState() => _ComplexPageState();
}

class _ComplexPageState extends State<ComplexPage> {
  final _tabBarViews = const [HomePage(), SquarePage(), AskPage()];

  @override
  void initState() {
    super.initState();
    debugPrint('ComplexPage - initState');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: _tabBarViews.length,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      tabs: [
                        Text(S.of(context).tabHome),
                        Text(S.of(context).tabSquare),
                        Text(S.of(context).tabAsk),
                      ],
                      isScrollable: true, // 是否可滑动
                      indicator: const BoxDecoration(), // 取消下划线
                      unselectedLabelColor:
                          ColorHandler.globalGreyColor, // 未选中颜色
                      unselectedLabelStyle:
                          TextStyleHandler.styleOrange16, // 未选中样式
                      labelColor: ColorHandler.globalGreenColor, // 选中颜色
                      labelStyle: TextStyleHandler.styleTangerine24Bold, // 选中样式
                    ),
                  ),
                  // 间隔
                  const Expanded(child: SizedBox()),
                  // 搜索框
                  Ripple(
                    circular: 20,
                    onTap: () => Get.toNamed(AppRoutes.complexSearch),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SvgPicture.asset(
                        R.assetsSvgSearchSvg,
                        color: Colors.black87,
                        width: 30,
                      ),
                    ),
                  ),
                  GapHandler.hGap20,
                ],
              ),
              Expanded(
                child: TabBarView(children: _tabBarViews),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// TabData类
class TabData {
  TabData({required this.tab, required this.body});

  final Widget tab;
  final Widget body;
}
