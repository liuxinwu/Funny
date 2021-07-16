import 'package:flutter/material.dart';
import '/components/fTabBar.dart';
import '/pages/home/index.dart';
import '/pages/my/index.dart';

// 包含 tabBar 的容器
class App extends StatefulWidget {
  @override
  _AppState createState() => new _AppState();
}

class _AppState extends State<App> {
  int currentTab = 0;

  getBody() {
    switch (currentTab) {
      case 0:
        return Home();
      case 1:
        return My();
      default:
        return Home();
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
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: statusBarHeight,
            child:
                Container(child: null, color: Theme.of(context).primaryColor),
          ),
          new Expanded(
            child: getBody(),
          ),
        ],
      ),
      bottomNavigationBar:
          FTabBar(currentTab: currentTab, setCurrentTab: setCurrentTab),
    );
  }
}
