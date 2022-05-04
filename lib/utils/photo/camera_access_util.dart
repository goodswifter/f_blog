///
/// Author       : zhongaidong
/// Date         : 2022-05-02 14:51:59
/// Description  :
///
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';
import 'permission_util.dart';

class CameraAccessUtil {
  static Future<AssetEntity?> cameraImage(
      {required BuildContext context, bool enableRecording = false}) async {
    AssetEntity? assetEntity;
    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.photos,
    ].request();

    bool isFirstAccessCamera = PermissionUtil.isFirstAccessCamera();
    bool isFirstAccessPhotos = PermissionUtil.isFirstAccessPhotos();

    PermissionStatus cameraStatus = statuses[Permission.camera]!;
    PermissionStatus photosStatus = statuses[Permission.photos]!;
    if (cameraStatus == PermissionStatus.granted &&
        photosStatus == PermissionStatus.granted) {
      assetEntity = await CameraPicker.pickFromCamera(
        context,
        pickerConfig: CameraPickerConfig(enableRecording: enableRecording),
      );
      return assetEntity;
    } else if (!isFirstAccessCamera || !isFirstAccessPhotos) {
      // 只要相册和相机都不是第一次访问, 就提示相机权限未开启
      showModalPopup(context);
    }
    return null;
  }

  static showModalPopup(BuildContext ctx) {
    showCupertinoDialog(
      context: ctx,
      builder: (context) => CupertinoAlertDialog(
        title: const Text("相机或相册权限未开启"),
        content: const Text(
          "请在iPhone的“设置 > 京师OA”选项中，允许OA访问你的摄像头和所有照片。",
          maxLines: 4,
        ),
        actions: [
          CupertinoDialogAction(
            child: const Text('我知道了'),
            onPressed: () => Get.back(),
          ),
          CupertinoDialogAction(
            child: const Text('前往设置'),
            onPressed: () async {
              Get.back();
              await openAppSettings();
            },
          ),
        ],
      ),
    );
  }
}
