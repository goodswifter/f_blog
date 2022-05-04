///
/// Author       : zhongaidong
/// Date         : 2022-04-29 23:07:23
/// Description  : 未知页面
///
import 'package:flutter/material.dart';

class UnknownPage extends StatelessWidget {
  const UnknownPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('未知页面')),
      body: const Center(
        child: Text('请查看路由配置'),
      ),
    );
  }
}
