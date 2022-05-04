///
/// Author       : zhongaidong
/// Date         : 2022-04-26 12:29:54
/// Description  : 圆角头像Widget
///
import 'package:blog/core/resource/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeadCircleWidget extends StatelessWidget {
  const HeadCircleWidget({
    Key? key,
    this.size = 60,
  }) : super(key: key);
  final double size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size),
      child: Container(
        width: size,
        height: size,
        color: Colors.white,
        child: SvgPicture.asset(R.assetsSvgUserHeaderDefaultIconSvg),
      ),
    );
  }
}
