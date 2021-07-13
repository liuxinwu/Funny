import 'package:flutter/material.dart';
import './router/routers.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '风趣视频',
        theme: new ThemeData(
          appBarTheme: AppBarTheme(backgroundColor: Colors.red, brightness: Brightness.light),
          primaryColor: Colors.red,
        ),
        routes: routers);
  }
}
