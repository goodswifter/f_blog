///
/// Author       : zhongaidong
/// Date         : 2022-04-26 12:23:30
/// Description  : 首页 微信公众号Item
///
import 'package:blog/core/resource/gap_handler.dart';
import 'package:blog/core/resource/r.dart';
import 'package:blog/core/resource/shadow_handler.dart';
import 'package:blog/core/resource/text_style_handler.dart';
import 'package:blog/core/resource/wechat_handler.dart';
import 'package:blog/entity/wechat_public_entity.dart';
import 'package:blog/widgets/head_circle_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeWechatPublicItem extends StatelessWidget {
  const HomeWechatPublicItem({Key? key, required this.item}) : super(key: key);

  final WechatPublicEntity item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: ShadowHandler.white12Circle(radius: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: W.wechatPublic.containsKey(item.id)
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      width: 64,
                      height: 64,
                      color: Colors.white,
                      child: Image.asset(W.wechatPublic[item.id] ?? ""),
                    ),
                  )
                : const HeadCircleWidget(size: 64),
            decoration: ShadowHandler.black12Circle40(),
          ),
          GapHandler.vGap15,
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                R.assetsSvgWechatSvg,
                width: 20,
              ),
              GapHandler.hGap3,
              Text(
                item.name,
                style: TextStyleHandler.styleBlack14,
              ),
            ],
          )
        ],
      ),
    );
  }
}
