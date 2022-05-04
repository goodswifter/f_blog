///
/// Author       : zhongaidong
/// Date         : 2022-04-26 12:13:44
/// Description  : 首页 微信公众号Widget
///
import 'package:blog/core/resource/decoration_handler.dart';
import 'package:blog/core/resource/gap_handler.dart';
import 'package:blog/core/resource/text_style_handler.dart';
import 'package:blog/entity/wechat_public_entity.dart';
import 'package:blog/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_controller.dart';
import 'home_wechat_public_end_widget.dart';
import 'home_wechat_public_item.dart';

class HomeWechatPublicWidget extends StatefulWidget {
  const HomeWechatPublicWidget({
    Key? key,
    required this.wechatPublics,
    this.isFirst = false,
    this.onChange,
    this.onTap,
    this.showSwitch = false,
    this.showDelete = false,
  }) : super(key: key);

  /// 微信公众号数据
  final List<WechatPublicEntity> wechatPublics;

  /// 是否第一次加载
  final bool isFirst;

  /// 点击换一批
  final GestureTapCallback? onChange;

  /// 点击背景触发
  final GestureTapCallback? onTap;

  /// 是否显示换一批按钮
  final bool showSwitch;

  /// 是否显示不感兴趣按钮
  final bool showDelete;

  @override
  State<HomeWechatPublicWidget> createState() => _HomeWechatPublicWidgetState();
}

class _HomeWechatPublicWidgetState extends State<HomeWechatPublicWidget>
    with TickerProviderStateMixin {
  late AnimationController sizeController;
  late Animation<double> sizeAnimation;

  final homeController = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
    initAnimation(widget.isFirst);
  }

  /// 初始化动画控制器
  initAnimation(bool isFirst, {int milliseconds = 1500}) {
    sizeController = AnimationController(
        vsync: this, duration: Duration(milliseconds: milliseconds));
    sizeAnimation = Tween(begin: isFirst ? 0.0 : 1.0, end: isFirst ? 1.0 : 0.0)
        .animate(
            CurvedAnimation(parent: sizeController, curve: Curves.easeOut));
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isFirst) {
      sizeController.forward();
      homeController.isFirst = false;
    }
    return GestureDetector(
      onTap: widget.onTap,
      child: SizeTransition(
        axis: Axis.vertical,
        sizeFactor: sizeAnimation,
        child: Stack(
          alignment: AlignmentDirectional.centerEnd,
          children: [
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: DecorationHandler.divider(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GapHandler.vGap10,
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(S.of(context).tabWechatPublic,
                          style: TextStyleHandler.styleGrey14),
                    ),
                    GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount: widget.wechatPublics.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: (BuildContext context, int index) {
                          return HomeWechatPublicItem(
                              item: widget.wechatPublics[index]);
                        })
                  ],
                )),
            Positioned(
              child: Column(
                children: [
                  HomeWechatPublicEndWidget(
                    icon: Icons.autorenew,
                    text: S.of(context).tabWechatSwitch,
                    onTap: widget.onChange,
                    show: widget.showSwitch,
                  ),
                  GapHandler.vGap20,
                  HomeWechatPublicEndWidget(
                    icon: Icons.clear,
                    text: S.of(context).tabWechatDelete,
                    show: widget.showDelete,
                    onTap: () {
                      if (widget.showDelete) {
                        /// 开始执行隐藏动画
                        initAnimation(false, milliseconds: 1000);
                        sizeController.forward();
                        homeController.update();

                        /// 动画监听
                        sizeAnimation.addStatusListener((state) {
                          if (state == AnimationStatus.completed) {
                            /// 动画执行完成之后将微信公众号从中剔除
                            homeController
                              ..insertIndex = -1
                              ..update();
                          }
                        });
                      } else {
                        homeController.showDelete.value = true;
                      }
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
