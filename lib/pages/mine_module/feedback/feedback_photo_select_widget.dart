/// 
/// Author       : zhongaidong
/// Date         : 2022-05-02 10:16:48
/// Description  : 图片选择Widget
/// 
import 'package:blog/core/base/pages/get_common_view.dart';
import 'package:blog/core/resource/color_handler.dart';
import 'package:flutter/material.dart';

import 'feedback_controller.dart';

class FeedbackPhotoSelectWidget extends GetCommonView<FeedbackController> {
  const FeedbackPhotoSelectWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: controller.photos.length + 1,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, childAspectRatio: 1),
      itemBuilder: (BuildContext context, int index) {
        return Stack(
          alignment: AlignmentDirectional.topEnd,
          fit: StackFit.loose,
          textDirection: TextDirection.ltr,
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => controller.openGallery(index),
              child: Material(
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: _getSelectWidget(index),
                ),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            Offstage(
              offstage: index == controller.photos.length,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => controller
                  ..photos.removeAt(index)
                  ..update(),
                child: SizedBox(
                  width: 15,
                  height: 15,
                  child: Material(
                    color: ColorHandler.globalDarkBlueColor,
                    child: const Icon(
                      Icons.close,
                      size: 10,
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              // child:
            ),
          ],
        );
      },
    );
  }

  /// 最后一张图片显示为+号，其他图片显示为本地图片，并进行裁剪
  /// [pos] 当前位置
  /// 此处直接创建对象是因为在增加item时UI必须要重新绘制
  /// Element虚拟树层级一定会改变，所以此处直接返回一个新的Widget
  Widget _getSelectWidget(int pos) {
    if (pos == controller.photos.length) {
      /// 最后一张一定为加号
      return Container(
        width: 80,
        height: 80,
        color: Colors.white,
        alignment: Alignment.center,
        child: const Icon(
          Icons.add,
          size: 60,
          color: ColorHandler.globalGreyColor,
        ),
      );
    } else {
      /// 本地图片显示并裁剪
      return ClipRRect(
        child: Image.file(
          controller.photos[pos],
          width: 80,
          height: 80,
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(3),
      );
    }
  }
}