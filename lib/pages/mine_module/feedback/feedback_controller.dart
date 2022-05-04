/// 
/// Author       : zhongaidong
/// Date         : 2022-04-26 22:01:03
/// Description  : 问题反馈页面 controller层
/// 
import 'dart:io';

import 'package:blog/core/base/controller/base_get_controller.dart';
import 'package:blog/core/base/get_extension.dart';
import 'package:blog/generated/l10n.dart';
import 'package:blog/utils/keyboard_util.dart';
import 'package:blog/utils/toast_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class FeedbackController extends BaseGetController {
  /// 存储本地选择的图片
  List<File> photos = [];

  /// 问题
  String issue = '';

  /// 联系方式
  String contact = '';

  /// 打开相册
  /// [index] 索引
  openGallery(int index) async {
    if (photos.length >= 4) {
      ToastUtil.show(S.current.feedbackToast);
      return;
    }
    if (index == photos.length) {
      var image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        photos.add(File(image.path));
      }
      update();
    }
  }

  /// 由于没有反馈接口，因此延时2秒进行操作
  requestFeedback(BuildContext context) {
    debugPrint("feedback >> issue == $issue");
    debugPrint("feedback >> contact == $contact");
    debugPrint("feedback >> photo == $photos");
    if (issue.isEmpty) {
      ToastUtil.show(S.current.feedbackContent);
      return;
    }
    KeyboardUtil.hideKeyboard(context);
    Get.showLoading();
    Future.delayed(const Duration(seconds: 2)).then((value) {
      Get.dismiss();
      ToastUtil.show(S.current.feedbackSuccess);
      Get.back();
    });
  }
}