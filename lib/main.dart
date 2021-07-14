
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './router/routers.dart';

void main() {
  // 设置状态栏的显示模式
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '风趣娱乐',
        theme: new ThemeData(
          appBarTheme: AppBarTheme(backgroundColor: Colors.red, brightness: Brightness.light),
          primaryColor: Colors.red,
          brightness: Brightness.light,
          iconTheme: IconThemeData(color: Colors.white)
        ),
        routes: routers);
  }
}
