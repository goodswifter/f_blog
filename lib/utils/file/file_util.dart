///
/// Author       : zhongaidong
/// Date         : 2022-04-29 23:40:59
/// Description  : 文件管理工具类
///
import 'package:blog/generated/l10n.dart';
import 'package:blog/utils/toast_util.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class FileUtil {
  /// 保存assets图片到本地
  /// [assets] 本地图片路径
  /// [target] 目标路径
  static saveAssetsGallery({String assets = '', String target = ''}) async {
    ByteData bytes = await rootBundle.load(assets);
    await ImageGallerySaver.saveImage(bytes.buffer.asUint8List());
    ToastUtil.show(S.current.saveSuccess);
  }
}
