///
/// Author       : zhongaidong
/// Date         : 2022-05-01 22:24:13
/// Description  : 设置语言 item
///
import 'package:blog/core/resource/color_handler.dart';
import 'package:blog/entity/language_entity.dart';
import 'package:blog/generated/l10n.dart';
import 'package:blog/utils/locale_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingLanguageItem extends StatelessWidget {
  const SettingLanguageItem({
    Key? key,
    required this.languages,
    required this.index,
  }) : super(key: key);

  final List<LanguageEntity> languages;
  final int index;

  @override
  Widget build(BuildContext context) {
    String title = languages[index].name.isEmpty
        ? S.of(context).settingLanguageDefault
        : languages[index].name;
    return ListTile(
        onTap: () {
          /// 更新语言
          languages
            ..forEach((item) {
              item.isSelect = false;
            })
            ..[index].isSelect = true;
          LocaleUtil.updateLocale(languages[index]);
          Get.back();
        },
        title: Text(title),
        trailing: Visibility(
          visible: languages[index].isSelect,
          child: const Icon(
            Icons.radio_button_checked,
            color: ColorHandler.globalGreenColor,
            size: 20,
          ),
        ));
  }
}
