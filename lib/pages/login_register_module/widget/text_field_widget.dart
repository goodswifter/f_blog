///
/// Author       : zhongaidong
/// Date         : 2022-04-23 19:14:48
/// Description  : 输入框
/// 左边图标，右边输入框
///
import 'package:blog/core/resource/text_style_handler.dart';
import 'package:blog/utils/text_input_formatter_util/length_text_input_formatter.dart';
import 'package:blog/utils/text_input_formatter_util/reg_exp_text_input_formatter.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    Key? key,
    required this.iconWidget,
    this.onChanged,
    this.hintText = '',
    this.passwordType = false,
  }) : super(key: key);

  /// 输入框文字改变
  final ValueChanged<String>? onChanged;

  /// 提示文字
  final String hintText;

  /// 图标Widget
  final Widget iconWidget;

  /// 图标Widget
  final bool passwordType;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool showPassword = false;
  bool eyeExpand = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        Container(
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            textAlign: TextAlign.left,
            autofocus: false,
            maxLines: 1,
            obscureText: eyeExpand && widget.passwordType,
            style: TextStyleHandler.styleWhite16,
            onChanged: (text) {
              widget.onChanged?.call(text);
              setState(() {
                showPassword = text.isNotEmpty;
              });
            },
            inputFormatters: [
              // 输入长度和格式限制
              LengthTextInputFormatter(maxLength: 16),
              RegExpTextInputFormatter(
                filterPattern: RegExp('[a-zA-Z]|[0-9]'),
              ),
            ],

            // 样式
            decoration: InputDecoration(
                fillColor: Colors.white12,
                filled: true,
                hintText: widget.hintText,
                hintStyle: TextStyleHandler.styleWhite16,
                border: _getEditBorder(false),
                focusedBorder: _getEditBorder(true),
                disabledBorder: _getEditBorder(false),
                enabledBorder: _getEditBorder(false),
                contentPadding: const EdgeInsets.only(
                    top: 16, bottom: 16, left: 60, right: 16)),
          ),
          margin: const EdgeInsets.only(top: 8, bottom: 8, left: 25, right: 25),
        ),
        Positioned(
          width: 36,
          height: 36,
          left: 36,
          child: widget.iconWidget,
        ),
        Positioned(
          left: 76,
          child: Container(
            width: 1,
            height: 18,
            color: Colors.white54,
          ),
        ),
        Positioned(
          right: 40,
          child: Visibility(
            visible: showPassword && widget.passwordType,
            child: IconButton(
              icon: Icon(
                eyeExpand ? Icons.remove_red_eye : Icons.visibility_off,
                size: 24,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  eyeExpand = !eyeExpand;
                });
              },
            ),
          ),
        )
      ],
    );
  }

  /// 获取输入框的Border属性，可公用
  /// [isEdit] 是否获取焦点
  OutlineInputBorder _getEditBorder(bool isEdit) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      borderSide: BorderSide(
        color: isEdit ? Colors.green : Colors.white24,
        width: 1,
      ),
    );
  }
}
