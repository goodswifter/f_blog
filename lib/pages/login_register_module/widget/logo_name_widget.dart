///
/// Author       : zhongaidong
/// Date         : 2022-04-23 19:09:41
/// Description  : 登录Logo Widget
///
import 'package:blog/core/resource/r.dart';
import 'package:blog/core/resource/text_style_handler.dart';
import 'package:blog/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoNameWidget extends StatelessWidget {
  const LogoNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            R.assetsSvgApplicationTransparentIconSvg,
            color: Colors.white,
            width: 80,
          ),
          Text(
            S.of(context).appName,
            style: TextStyleHandler.styleWhite36,
          )
        ],
      ),
    );
  }
}
