///
/// Author       : zhongaidong
/// Date         : 2022-04-27 00:11:29
/// Description  : 搜索框
///
import 'package:blog/core/resource/color_handler.dart';
import 'package:blog/core/resource/decoration_handler.dart';
import 'package:blog/core/resource/r.dart';
import 'package:blog/core/resource/text_style_handler.dart';
import 'package:blog/utils/text_input_formatter_util/length_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchInputWidget extends StatefulWidget {
  const SearchInputWidget({
    Key? key,
    this.onChanged,
    this.onSubmitted,
    this.hintText = '请输入您要搜索的内容',
    this.maxLength = 20,
    this.controller,
  }) : super(key: key);

  /// 输入框占位符
  final String hintText;

  /// 最大长度
  final int maxLength;

  /// 输入框值发生变化时触发
  final ValueChanged<String>? onChanged;

  /// 输入框当点击完成时触发
  final ValueChanged<String>? onSubmitted;

  /// 文本控制器
  final TextEditingController? controller;

  @override
  State<SearchInputWidget> createState() => _SearchInputWidgetState();
}

class _SearchInputWidgetState extends State<SearchInputWidget> {
  late TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();
  bool _isShowClearButton = false;
  String _oldText = '';

  @override
  void initState() {
    super.initState();

    _controller = widget.controller ?? TextEditingController();

    _focusNode.addListener(() {
      _isShowClearButton = _focusNode.hasFocus && _controller.text.isNotEmpty;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 5),
          child: SvgPicture.asset(
            R.assetsSvgSearchSvg,
            color: Colors.black87,
            width: 24,
          ),
        ),
        Container(
          height: 36,
          decoration: DecorationHandler.custom(
            color: ColorHandler.shadowColor,
            borderColor: ColorHandler.shadowColor,
            radius: 30,
          ),
          child: TextField(
            textAlign: TextAlign.left,
            autofocus: false,
            maxLines: 1,
            style: TextStyleHandler.styleBlack14,
            onChanged: (text) {
              if (_oldText != text) {
                _oldText = text;
                widget.onChanged?.call(text);
                _isShowClearButton = _focusNode.hasFocus && text.isNotEmpty;
                setState(() {});
              }
            },
            onSubmitted: widget.onSubmitted,
            focusNode: _focusNode,
            controller: _controller,
            inputFormatters: [
              // 输入长度和格式限制
              LengthTextInputFormatter(maxLength: widget.maxLength),
            ],
            // 样式
            decoration: InputDecoration(
              fillColor: Colors.white12,
              filled: true,
              hintText: widget.hintText,
              hintStyle: TextStyleHandler.styleGrey14,
              border: _getEditBorder(),
              focusedBorder: _getEditBorder(),
              disabledBorder: _getEditBorder(),
              enabledBorder: _getEditBorder(),
              contentPadding:
                  const EdgeInsets.only(top: 6, bottom: 6, left: 30, right: 30),
              suffixIcon: _isShowClearButton ? buildClearButton() : null,
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  Widget buildClearButton() {
    return IconButton(
      onPressed: () {
        _controller.clear();
        widget.onChanged?.call('');
        _isShowClearButton = false;
        setState(() {});
      },
      icon: const Icon(
        Icons.cancel_rounded,
        color: ColorHandler.globalGreyColor,
        size: 18,
      ),
    );
  }

  /// 获取输入框的Border属性，可公用
  /// [isEdit]是否获取焦点
  OutlineInputBorder _getEditBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    );
  }
}
