///
/// Author       : zhongaidong
/// Date         : 2022-04-29 23:28:06
/// Description  : 分享弹窗
///
import 'package:blog/core/base/get_extension.dart';
import 'package:blog/core/resource/button_style_handler.dart';
import 'package:blog/core/resource/color_handler.dart';
import 'package:blog/core/resource/divider_handler.dart';
import 'package:blog/core/resource/gap_handler.dart';
import 'package:blog/core/resource/r.dart';
import 'package:blog/core/resource/text_style_handler.dart';
import 'package:blog/generated/l10n.dart';
import 'package:blog/utils/file/file_util.dart';
import 'package:blog/utils/navigator_util.dart';
import 'package:blog/utils/permission_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'base_dialog_widget.dart';

class ShareDialogWidget extends StatelessWidget {
  const ShareDialogWidget({Key? key, this.url = 'https://www.baidu.com'})
      : super(key: key);

  /// 分享链接
  final String url;

  @override
  Widget build(BuildContext context) {
    return BaseDialogWidget(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GapHandler.vGap30,
          Text(
            S.of(context).shareApplication,
            style: TextStyleHandler.styleBlack16,
          ),
          GapHandler.vGap5,
          Text(
            S.of(context).shareHint,
            style: TextStyleHandler.styleGrey14,
          ),
          GapHandler.vGap10,
          Image.asset(
            R.assetsImagesShareQrcodePng,
            width: 120,
            height: 120,
          ),
          GapHandler.vGap20,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // 浏览器打开
              _buildShareIcon(ColorHandler.globalGreenColor, Icons.public,
                  () => NavigatorUtil.launchInBrowser(url)),
              // 保存在本地
              _buildShareIcon(ColorHandler.globalTangerineColor, Icons.download,
                  () {
                PermissionUtil.sendPermission((value) {
                  if (value) {
                    FileUtil.saveAssetsGallery(
                        assets: R.assetsImagesShareQrcodePng);
                  }
                });
              }),
            ],
          ),
          GapHandler.vGap5,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // 在浏览器打开
              Text(
                S.of(context).shareBrowser,
                style: TextStyleHandler.styleGrey13,
              ),
              // 保存在本地
              Text(
                S.of(context).shareSaveLocal,
                style: TextStyleHandler.styleGrey13,
              ),
            ],
          ),
          GapHandler.vGap30,
          DividerHandler.divider1Half,
          SizedBox(
            width: double.infinity,
            height: 60,
            child: TextButton(
              style: ButtonStyleHandler.getNoShapeStyle(),
              onPressed: () => Get.dismiss(),
              child: Text(
                S.of(context).quit,
                style: TextStyleHandler.styleBlack16,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildShareIcon(Color color, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Icon(icon, color: color, size: 30),
        decoration: const BoxDecoration(
          color: ColorHandler.shadowColor,
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
      ),
    );
  }
}
