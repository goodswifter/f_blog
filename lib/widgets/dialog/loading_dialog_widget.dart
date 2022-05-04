///
/// Author       : zhongaidong
/// Date         : 2022-04-22 14:33:41
/// Description  : 公共加载弹窗
///
import 'package:blog/core/resource/gap_handler.dart';
import 'package:blog/core/resource/r.dart';
import 'package:blog/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingDialogWidget extends StatelessWidget {
  const LoadingDialogWidget({Key? key, this.text}) : super(key: key);

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Material(
      // 创建透明层
      type: MaterialType.transparency, // 透明类型
      child: Center(
        // 保证控件居中效果
        child: SizedBox(
          width: 120,
          height: 120,
          child: Container(
            decoration: const ShapeDecoration(
              // color: Colors.black45,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Lottie.asset(R.assetsLottiePageLoadingAnimJson,
                        width: 60, animate: true),
                  ),
                ),
                GapHandler.vGap10,
                Text(
                  (text == null || text!.isEmpty)
                      ? S.of(context).loading
                      : text!,
                ),
                // style: TextStyleHandler.styleWhite14),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
