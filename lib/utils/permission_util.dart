/// 
/// Author       : zhongaidong
/// Date         : 2022-04-29 23:38:29
/// Description  : 权限申请工具类
/// 
import 'package:permission_handler/permission_handler.dart';

class PermissionUtil {
  static sendPermission(Function(bool) result) {
    Permission.camera.status.then((value) {
      if (value.isGranted) {
        result(true);
      } else {
        Permission.storage.request().then((value) {
          result(value.isGranted);
        });
      }
    });
  }
}