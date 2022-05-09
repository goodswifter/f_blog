///
/// Author       : zhongaidong
/// Date         : 2022-04-21 10:09:00
/// Description  : 主页
///
import 'package:blog/core/base/pages/get_save_state_view.dart';
import 'package:blog/core/resource/color_handler.dart';
import 'package:blog/generated/l10n.dart';
import 'package:blog/pages/main_module/lazy_indexed_stack.dart';
import 'package:blog/pages/main_module/main_controller.dart';
import 'package:blog/widgets/dialog/share_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MainPage extends GetSaveStateView<MainController> {
  const MainPage({Key? key}) : super(key: key);

  @override
  get lifecycle => (AppLifecycleState state) {
        if (state == AppLifecycleState.resumed) {
          var clipboardData = Clipboard.getData(Clipboard.kTextPlain);
          clipboardData.then((value) {
            debugPrint("clipboardData=> ${value?.text}");
            if (value != null &&
                value.text != null &&
                value.text!.isNotEmpty &&
                (value.text!.startsWith("https://") ||
                    value.text!.startsWith("http://"))) {
              Get.dialog(ShareDialogWidget(url: value.text!));
            }
          });
        }
      };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHandler.backgroundColor,
      body: LazyIndexedStack(
        index: controller.currentIndex,
        children: controller.bodyList,
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
        currentIndex: controller.currentIndex,
        onTap: controller.onTap,
      ),
    );
  }
}
