import 'package:flutter/material.dart';
import '/components/fTabbar.dart';
import '/pages/home/index.dart';
import '/pages/my/index.dart';

// 包含 tabbar 的容器
class App extends StatefulWidget {
  @override
  _AppState createState() => new _AppState();
}

class _AppState extends State<App> {
  int currentTab = 0;

  getBody() {
    switch(currentTab) {
      case 0: return Home();
      case 1: return My();
      default: return Home();
    }
  }

  setCurrentTab(newCurrentTab) {
    print(newCurrentTab);
    setState(() {
      currentTab = newCurrentTab;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Funny'),
      ),
      body: getBody(),
      bottomNavigationBar: FTabbar(
        currentTab: currentTab,
        setCurrentTab: setCurrentTab
      ),
    );
  }
}
