import 'package:flutter/material.dart';

// 占位状态栏组件
class FStatusBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return SizedBox(
      height: statusBarHeight,
      child: Container(child: null, color: Theme.of(context).primaryColor),
    );
  }
}
