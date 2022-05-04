///
/// Author       : zhongaidong
/// Date         : 2022-04-21 10:09:00
/// Description  : 主页
///
import 'package:blog/core/resource/color_handler.dart';
import 'package:blog/generated/l10n.dart';
import 'package:blog/pages/complex_module/complex_page/complex_page.dart';
import 'package:blog/pages/main_module/lazy_indexed_stack.dart';
import 'package:blog/pages/mine_module/mine_page.dart';
import 'package:blog/pages/project_module/project_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final bodyList = [
    LazyStackChild(child: const ComplexPage()),
    LazyStackChild(child: const ProjectPage()),
    LazyStackChild(child: const MinePage(), preload: true),
  ];

  final pageController = PageController();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHandler.backgroundColor,
      body: LazyIndexedStack(
        index: currentIndex,
        children: bodyList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.turned_in),
              label: S.of(context).homeComplex),
          BottomNavigationBarItem(
              icon: const Icon(Icons.send), label: S.of(context).homeProject),
          BottomNavigationBarItem(
              icon: const Icon(Icons.person), label: S.of(context).homeMy),
        ],
        selectedItemColor: ColorHandler.globalGreenColor,
        unselectedItemColor: ColorHandler.globalGreyColor,
        currentIndex: currentIndex,
        onTap: onTap,
      ),
    );
  }

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
