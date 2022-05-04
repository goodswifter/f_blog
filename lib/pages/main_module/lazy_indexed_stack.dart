/// Author       : zhongaidong
/// Date         : 2022-04-21 19:08:42
/// Description  : 导航栏懒加载 + 缓存
///
import 'package:flutter/material.dart';

class LazyIndexedStack extends StatefulWidget {
  const LazyIndexedStack({
    Key? key,
    required this.index,
    this.alignment = AlignmentDirectional.topStart,
    this.textDirection,
    this.sizing = StackFit.loose,
    this.children = const <LazyStackChild>[],
  }) : super(key: key);

  final AlignmentGeometry alignment;
  final TextDirection? textDirection;
  final StackFit sizing;
  final int index;
  final List<LazyStackChild> children;

  @override
  State<LazyIndexedStack> createState() => _LazyIndexedStackState();
}

class _LazyIndexedStackState extends State<LazyIndexedStack> {
  late List<Widget> _childrens;

  late List<bool> _hasShowedlist;

  @override
  void initState() {
    super.initState();
    int length = widget.children.length;
    _childrens = List.generate(length, (index) {
      if (index == widget.index || widget.children[index].preload) {
        return widget.children[index].child;
      } else {
        return Container();
      }
    });
    _hasShowedlist = List.generate(length, (index) {
      return index == widget.index || widget.children[index].preload;
    });
  }

  @override
  void didUpdateWidget(covariant LazyIndexedStack oldWidget) {
    if (!_hasShowedlist[widget.index]) {
      _hasShowedlist[widget.index] = true;
      _childrens[widget.index] = widget.children[widget.index].child;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: widget.index,
      children: _childrens,
      alignment: widget.alignment,
      textDirection: widget.textDirection,
      sizing: widget.sizing,
    );
  }
}

/// 自定义懒加载子组件
class LazyStackChild {
  /// 是否预加载
  final bool preload;

  /// 子组件
  final Widget child;

  LazyStackChild({required this.child, this.preload = false});
}
