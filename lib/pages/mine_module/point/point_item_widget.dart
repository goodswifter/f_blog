///
/// Author       : zhongaidong
/// Date         : 2022-05-02 20:03:12
/// Description  : 积分排行Item
///
import 'package:blog/core/resource/color_handler.dart';
import 'package:blog/core/resource/gap_handler.dart';
import 'package:blog/core/resource/r.dart';
import 'package:blog/core/resource/text_style_handler.dart';
import 'package:blog/entity/point_entity.dart';
import 'package:blog/utils/date_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PointItemWidget extends StatelessWidget {
  const PointItemWidget({Key? key, required this.points}) : super(key: key);

  /// 排名信息
  final PointEntity points;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 0.5, color: ColorHandler.shadowColor))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GapHandler.hGap15,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GapHandler.hGap15,
                Text(
                  points.reason,
                  style: TextStyleHandler.styleBlack16,
                ),
                GapHandler.vGap3,
                Text(
                  DateUtil.milliseconds2Date(points.date),
                  style: TextStyleHandler.styleGrey13,
                ),
              ],
            ),
          ),
          Text(
            '+${points.coinCount}',
            style: TextStyleHandler.styleTangerine24Bold,
          ),
          GapHandler.hGap5,
          SvgPicture.asset(
            R.assetsSvgPointsSvg,
            width: 22,
          ),
          GapHandler.hGap15,
        ],
      ),
    );
  }
}
