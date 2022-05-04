///
/// Author       : zhongaidong
/// Date         : 2022-04-29 23:20:41
/// Description  : 公共图标-标题-右侧标题样式
///
import 'package:blog/core/resource/color_handler.dart';
import 'package:blog/core/resource/text_style_handler.dart';
import 'package:flutter/material.dart';

class IconTitleWidget extends StatelessWidget {
  const IconTitleWidget({
    Key? key,
    this.text = '',
    this.icon,
    this.endIcon = Icons.arrow_forward_ios,
    this.size = 24,
    this.endSize = 16,
    this.color = Colors.black,
    this.endColor = Colors.black,
    this.onTap,
  }) : super(key: key);

  /// 图标
  final IconData? icon;

  /// 右侧图标
  final IconData endIcon;

  /// 标题文字
  final String text;

  /// 图标大小
  final double size;

  /// 右侧图标大小
  final double endSize;

  /// 图标颜色
  final Color color;

  /// 右侧图标颜色
  final Color endColor;

  /// 点击事件
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: ColorHandler.greyColor7,
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.only(left: 16),
          padding: const EdgeInsets.symmetric(vertical: 20),
          width: double.infinity,
          child: Stack(
            alignment: AlignmentDirectional.centerStart,
            children: [
              Positioned(
                child: Icon(
                  icon,
                  size: size,
                  color: color,
                ),
              ),
              Positioned(
                left: 36,
                child: Text(
                  text,
                  style: TextStyleHandler.styleBlack15,
                ),
              ),
              Positioned(
                right: 16,
                child: Icon(
                  endIcon,
                  size: endSize,
                  color: endColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
