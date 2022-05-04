///
/// Author       : zhongaidong
/// Date         : 2022-04-25 22:16:55
/// Description  : 积分排行榜 标题Widget
///
import 'package:blog/core/resource/color_handler.dart';
import 'package:blog/core/resource/text_style_handler.dart';
import 'package:blog/generated/l10n.dart';
import 'package:flutter/material.dart';

class RankingTitleWidget extends StatelessWidget {
  const RankingTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.5),
        color: ColorHandler.globalOrangeColor,
        borderRadius: BorderRadius.circular((25)),
      ),
      padding: const EdgeInsets.all(2.5),
      child: Container(
        height: 36,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1.5),
            color: ColorHandler.globalTangerineColor,
            borderRadius: BorderRadius.circular((25))),
        child: Flex(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          direction: Axis.horizontal,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  S.of(context).userRankingNumber,
                  style: TextStyleHandler.styleWhite16Bold,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  S.of(context).userNickname,
                  style: TextStyleHandler.styleWhite16Bold,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  S.of(context).userRankingCoin,
                  style: TextStyleHandler.styleWhite16Bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
