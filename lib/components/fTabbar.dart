import 'package:flutter/material.dart';

class FTabbar extends StatelessWidget {
  FTabbar({Key? key, required this.currentTab, required this.setCurrentTab})
      : super(key: key);

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
        BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
        BottomNavigationBarItem(icon: Icon(Icons.my_location), label: '我的')
      ],
    );
  }
}
