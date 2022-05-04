///
/// Author       : zhongaidong
/// Date         : 2022-04-26 22:02:29
/// Description  : 关于我们页面 view层
///
import 'package:blog/core/app/package_info.dart';
import 'package:blog/core/resource/const_handler.dart';
import 'package:blog/core/resource/divider_handler.dart';
import 'package:blog/core/resource/gap_handler.dart';
import 'package:blog/core/resource/r.dart';
import 'package:blog/core/resource/text_style_handler.dart';
import 'package:blog/generated/l10n.dart';
import 'package:blog/utils/web_util.dart';
import 'package:blog/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: S.of(context).aboutTitle),
          GapHandler.vGap30,
          Image.asset(
            R.assetsImagesApplicationIconPng,
            width: 120,
          ),
          GapHandler.vGap12,
          Text(
            S.of(context).appName,
            style: TextStyleHandler.styleBlack30,
          ),
          GapHandler.vGap5,
          Text(
            '${S.of(context).aboutVersion}${PackageInfo.versionName}',
            style: TextStyleHandler.styleBlack12,
          ),
          GapHandler.vGap5,
          Text(
            '${S.of(context).aboutBuild}${PackageInfo.versionCode}',
            style: TextStyleHandler.styleBlack12,
          ),
          GapHandler.vGap30,
          ListTile(
            title: Text(S.of(context).aboutGithub),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () => WebUtil.toWebPageOther(
              title: S.of(context).aboutGithub,
              link: ConstHandler.githubLike,
            ),
          ),
          DividerHandler.divider1HalfPadding20,
          ListTile(
            title: Text(S.of(context).aboutCSDN),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () => WebUtil.toWebPageOther(
              title: S.of(context).aboutCSDN,
              link: ConstHandler.csdnLike,
            ),
          ),
          DividerHandler.divider1HalfPadding20,
          ListTile(
            title: Text(S.of(context).aboutSupport),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () => WebUtil.toWebPageOther(
              title: S.of(context).aboutSupport,
              link: ConstHandler.wanAndroidLike,
            ),
          ),
          DividerHandler.divider1HalfPadding20,
          const Expanded(child: Text('')),
        ],
      ),
    );
  }
}
