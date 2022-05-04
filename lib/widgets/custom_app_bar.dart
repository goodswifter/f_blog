///
/// Author       : zhongaidong
/// Date         : 2022-04-23 19:04:17
/// Description  : 公共标题栏
///
import 'package:blog/core/resource/color_handler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({
    Key? key,
    this.title = "",
    this.titleStyle = const TextStyle(color: Colors.black87, fontSize: 16),
    this.endText = "",
    this.endWidget,
    this.backgroundColor = Colors.white,
    this.backOnTap,
    this.backColor = ColorHandler.globalGreyColor,
    this.isShowBack = true,
  }) : super(key: key);

  /// 标题文字
  final String title;

  /// 标题风格
  final TextStyle titleStyle;

  /// 右侧文字
  final String endText;

  /// 是否显示右侧
  final Widget? endWidget;

  /// 背景颜色
  final Color backgroundColor;

  /// 返回按钮颜色
  final Color backColor;

  /// 是否显示返回按钮
  final bool isShowBack;

  final VoidCallback? backOnTap;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    String title = parse(widget.title).body?.text ?? '';
    return Material(
      color: widget.backgroundColor,
      child: SafeArea(
        bottom: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              width: 60,
              child: widget.isShowBack
                  ? InkWell(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      onTap: widget.backOnTap ?? () => Get.back(),
                      splashColor: ColorHandler.greyColor5,
                      highlightColor: ColorHandler.greyColor5,
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        child: Icon(Icons.arrow_back, color: widget.backColor),
                      ),
                    )
                  : const Text(''),
              margin: const EdgeInsets.only(top: 10, bottom: 6),
            ),
            Expanded(
              child: Container(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  // maxLines: 1,
                  style: widget.titleStyle,
                ),
                padding: const EdgeInsets.only(top: 3),
              ),
            ),
            Container(
              width: 60,
              child: widget.endWidget ??
                  Text(
                    widget.endText,
                    style: const TextStyle(
                        color: ColorHandler.globalGreyColor, fontSize: 13),
                  ),
              padding: const EdgeInsets.all(15),
            ),
          ],
        ),
      ),
    );
  }
}
