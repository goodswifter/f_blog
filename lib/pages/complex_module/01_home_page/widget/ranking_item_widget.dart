///
/// Author       : zhongaidong
/// Date         : 2022-04-25 22:16:43
/// Description  :
///
import 'package:blog/core/resource/r.dart';
import 'package:blog/core/resource/text_style_handler.dart';
import 'package:blog/entity/ranking_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RankingItemWidget extends StatelessWidget {
  const RankingItemWidget({
    Key? key,
    required this.ranking,
  }) : super(key: key);

  /// 排名信息
  final RankingEntity ranking;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: Flex(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        direction: Axis.horizontal,
        children: [
          Expanded(
              flex: 1,
              child: Center(
                child: _numberRankingWidget(int.parse(ranking.rank)),
              )),
          Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  ranking.username,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyleHandler.styleBlack16Bold,
                ),
              )),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                ranking.coinCount.toString(),
                style: TextStyleHandler.styleBlack16Bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 根据排名设置图标或排名名称
  /// [rank]排名
  Widget _numberRankingWidget(int rank) {
    return rank == 1 || rank == 2 || rank == 3
        ? SvgPicture.asset(
            _getMedal(rank),
            width: 26,
          )
        : Text(
            ranking.rank.toString(),
            style: TextStyleHandler.styleBlack16Bold,
          );
  }

  /// 根据排名获取金牌、银牌、铜牌
  /// [rank]排名
  String _getMedal(int rank) {
    String medal = '';
    switch (rank) {
      case 1:
        medal = R.assetsSvgMedalGoldSvg;
        break;
      case 2:
        medal = R.assetsSvgMedalSilverSvg;
        break;
      case 3:
        medal = R.assetsSvgMedalBronzeSvg;
        break;
    }
    return medal;
  }
}
