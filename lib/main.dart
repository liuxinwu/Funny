import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:funny/router/index.dart';

void main() {
  // 设置状态栏的显示模式
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(FApp());
}

class FApp extends StatelessWidget {
  static const _primaryColor = Color.fromRGBO(223, 48, 49, 1);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '风趣娱乐',
      theme: new ThemeData(
          appBarTheme: AppBarTheme(
              backgroundColor: _primaryColor, brightness: Brightness.light),
          primaryColor: _primaryColor,
          brightness: Brightness.light,
          iconTheme: IconThemeData(color: Colors.white),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: Color.fromRGBO(25, 25, 25, 1),
              // unselectedIconTheme: IconThemeData(color: Colors.white60),
              // selectedIconTheme: IconThemeData(color: _primaryColor),
              // 直接设置 labelStyle 没用 需要设置 ItemColor
              // unselectedLabelStyle: TextStyle(color: _primaryColor),
              // selectedLabelStyle: TextStyle(color: Colors.white60),
              unselectedItemColor: Colors.white60,
              selectedItemColor: _primaryColor)),
      routes: FRoutes.routes,
      onGenerateRoute: FRoutes.onGenerateRoute,
      onUnknownRoute: FRoutes.onUnknownRoute,
    );
  }
}
