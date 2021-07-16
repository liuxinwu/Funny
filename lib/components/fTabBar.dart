import 'package:flutter/material.dart';
import 'package:funny/utils/iconfont.dart';

class FTabBar extends StatelessWidget {
  FTabBar({Key? key, required this.currentTab, required this.setCurrentTab})
      : super(key: key);

  static const double _iconSize = 20;

  final int currentTab;
  final Function setCurrentTab;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentTab,
      onTap: (index) {
        setCurrentTab(index);
      },
      // selectedItemColor: Theme.of(context).primaryColor,
      items: [
        BottomNavigationBarItem(
            icon: Icon(
              FIcons.home,
              size: _iconSize,
            ),
            label: '首页'),
        BottomNavigationBarItem(
            icon: Icon(
              FIcons.my,
              size: _iconSize,
            ),
            label: '我的')
      ],
    );
  }
}
