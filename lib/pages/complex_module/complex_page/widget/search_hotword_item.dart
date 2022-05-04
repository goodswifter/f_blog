///
/// Author       : zhongaidong
/// Date         : 2022-04-27 18:22:13
/// Description  : 热搜榜列表Item
///
import 'package:blog/core/resource/color_handler.dart';
import 'package:blog/core/resource/decoration_handler.dart';
import 'package:blog/core/resource/gap_handler.dart';
import 'package:blog/core/resource/r.dart';
import 'package:blog/core/resource/text_style_handler.dart';
import 'package:blog/entity/hot_word_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchHotWordItem extends StatelessWidget {
  const SearchHotWordItem({
    Key? key,
    required this.item,
    this.index = 0,
  }) : super(key: key);

  /// 列表数据
  final HotWordEntity item;

  /// 索引
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: DecorationHandler.custom(
            borderColor: getBgColor(),
            color: getBgColor(),
            radius: 2,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
            child: Text(
              '$index',
              style: index > 3
                  ? TextStyleHandler.styleBlack12
                  : TextStyleHandler.styleWhite12,
            ),
          ),
        ),
        GapHandler.hGap5,
        Container(
          alignment: Alignment.center,
          height: 18,
          child: Text(
            item.name,
            overflow: TextOverflow.ellipsis,
            style: TextStyleHandler.styleBlack14,
          ),
        ),
        GapHandler.hGap3,
        Visibility(
          visible: index <= 3,
          child: SvgPicture.asset(
            R.assetsSvgHotwordItemSvg,
            width: 15,
          ),
        )
      ],
    );
  }

  /// 获取热搜榜中的背景
  Color getBgColor() {
    switch (index) {
      case 1:
        return Colors.red;
      case 2:
        return ColorHandler.globalTangerineColor;
      case 3:
        return ColorHandler.globalOrangeColor;
      default:
        return ColorHandler.shadowColor;
    }
  }
}
