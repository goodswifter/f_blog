///
/// Author       : zhongaidong
/// Date         : 2022-04-22 20:14:28
/// Description  :
///
import 'package:blog/core/resource/button_style_handler.dart';
import 'package:blog/core/resource/divider_handler.dart';
import 'package:blog/core/resource/gap_handler.dart';
import 'package:blog/core/resource/text_style_handler.dart';
import 'package:blog/generated/l10n.dart';
import 'package:blog/widgets/over_scroll_behavior.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:blog/core/base/get_extension.dart';

class CommonDialogWidget extends StatelessWidget {
  const CommonDialogWidget({
    Key? key,
    this.title = '',
    this.content = '',
    this.backText = '',
    this.nextText = '',
    this.backVisible = true,
    this.nextVisible = true,
    this.backTap,
    this.nextTap,
  }) : super(key: key);

  /// 标题
  final String title;

  /// 内容
  final String content;

  /// 左侧文字
  final String backText;

  /// 右侧文字
  final String nextText;

  /// 左侧事件
  final VoidCallback? backTap;

  /// 右侧事件
  final VoidCallback? nextTap;

  /// 左侧是否隐藏
  final bool backVisible;

  /// 右侧是否隐藏
  final bool nextVisible;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency, // 透明样式
      // dialog居中
      child: Center(
        // 取消ListView滑动阴影
        child: ScrollConfiguration(
          behavior: OverScrollBehavior(),
          // ListView 的shrinkWrap属性可适应高度（有多少占多少）
          child: ListView(
            shrinkWrap: true,
            children: [
              /// 背景及内容、边距、圆角等，必须包裹在ListView中
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  decoration: const ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /// 标题、内容
                      GapHandler.vGap15,
                      Text(
                        title,
                        style: TextStyleHandler.styleBlack18Bold500,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        child: Text(
                          content,
                          style: TextStyleHandler.styleGrey2Font16,
                        ),
                      ),
                      DividerHandler.divider1Half,

                      /// 确定、取消按钮
                      Flex(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        direction: Axis.horizontal,
                        children: [
                          /// 对半分
                          _buildTextButton(
                              backTap,
                              backText.isEmpty ? S.of(context).quit : backText,
                              backVisible),
                          _buildTextButton(
                              nextTap,
                              nextText.isEmpty ? S.of(context).enter : nextText,
                              nextVisible)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 此处使用方法重新创建的原因是因为此处不需要频繁更新，不会造成过度创建
  _buildTextButton(VoidCallback? tap, String text, bool show) {
    return Visibility(
      visible: show,
      child: Expanded(
        child: TextButton(
          onPressed: () {
            Get.dismiss();
            tap?.call();
          },
          style: ButtonStyleHandler.getNoShapeStyle(),
          child: Container(
            alignment: Alignment.center,
            height: 60,
            child: Text(text, style: TextStyleHandler.styleBlack16),
          ),
        ),
      ),
    );
  }
}
