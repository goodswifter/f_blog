///
/// Author       : zhongaidong
/// Date         : 2022-04-26 22:02:29
/// Description  : 问题反馈页面 view层
///
import 'package:blog/core/base/pages/get_common_view.dart';
import 'package:blog/core/resource/color_handler.dart';
import 'package:blog/core/resource/gap_handler.dart';
import 'package:blog/core/resource/text_style_handler.dart';
import 'package:blog/generated/l10n.dart';
import 'package:blog/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import 'feedback_controller.dart';
import 'feedback_photo_select_widget.dart';

class FeedbackPage extends GetCommonView<FeedbackController> {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 标题栏
          CustomAppBar(
            title: S.of(context).homeFeedback,
          ),
          // 问题反馈标题
          ListView(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            children: [
              Container(
                child: Text(
                  S.of(context).feedbackTitleStar,
                  style: TextStyleHandler.styleDarkBlue14,
                ),
                margin: const EdgeInsets.only(top: 25, left: 25),
              ),
              // 问题反馈输入框
              Container(
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  textAlign: TextAlign.left,
                  autofocus: false,
                  onChanged: (text) {
                    controller
                      ..issue = text
                      ..update();
                  },
                  maxLines: 6,
                  maxLength: 200,
                  style: TextStyleHandler.styleDarkBlue14,
                  decoration: InputDecoration(
                    hintText: S.of(context).feedbackHint,
                    hintStyle: TextStyleHandler.styleGrey13,
                    border: _getEditBorder(),
                    focusedBorder: _getEditBorder(),
                    disabledBorder: _getEditBorder(),
                    enabledBorder: _getEditBorder(),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 14),
                  ),
                ),
                margin: const EdgeInsets.only(top: 15, left: 25, right: 25),
              ),
              // 上传截图(选题)
              Container(
                child: Row(
                  children: [
                    Text(
                      S.of(context).feedbackUploadPhoto,
                      style: TextStyleHandler.styleDarkBlue14,
                    ),
                    Text(
                      S.of(context).feedbackOptional,
                      style: TextStyleHandler.styleGrey14,
                    ),
                  ],
                ),
                margin: const EdgeInsets.only(top: 20, left: 25),
              ),
              // 图片选择框
              Container(
                child: const FeedbackPhotoSelectWidget(),
                margin: const EdgeInsets.only(top: 15, right: 18, left: 18),
              ),
              // 联系方式
              Container(
                child: Row(
                  children: [
                    Text(
                      S.of(context).feedbackContact,
                      style: TextStyleHandler.styleDarkBlue14,
                    ),
                    Text(
                      S.of(context).feedbackOptional,
                      style: TextStyleHandler.styleGrey14,
                    ),
                  ],
                ),
                margin: const EdgeInsets.only(top: 30, left: 25),
              ),
              // 联系方式输入框
              Container(
                child: TextField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.left,
                  autofocus: false,
                  maxLines: 1,
                  style: TextStyleHandler.styleDarkBlue14,
                  onChanged: (text) {
                    controller
                      ..contact = text
                      ..update();
                  },
                  decoration: InputDecoration(
                    hintText: S.of(context).feedbackConnectHint,
                    hintStyle: TextStyleHandler.styleGrey13,
                    border: _getEditBorder(),
                    focusedBorder: _getEditBorder(),
                    disabledBorder: _getEditBorder(),
                    enabledBorder: _getEditBorder(),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 11),
                  ),
                ),
                margin: const EdgeInsets.only(top: 15, left: 25, right: 25),
              ),
              // 联系QQ群
              Container(
                child: Text(
                  S.of(context).feedbackConnectQQ,
                  style: TextStyleHandler.styleDarkBlue14,
                ),
                margin: const EdgeInsets.only(top: 30, left: 25),
              ),
              GapHandler.vGap50,
              GestureDetector(
                onTap: () => controller.requestFeedback(context),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 13.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: ColorHandler.globalGreyColor, width: 1.0),
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Text(
                    S.of(context).feedbackSubmit,
                    style: TextStyleHandler.styleDarkBlue14,
                  ),
                  margin: const EdgeInsets.only(left: 90, right: 110),
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }

  // 获取输入框的Border属性，可公用
  OutlineInputBorder _getEditBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(
        color: ColorHandler.globalGreyColor,
        width: 1.0,
      ),
    );
  }
}
