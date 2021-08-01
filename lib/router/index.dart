import 'package:flutter/material.dart';
import 'package:funny/pages/app.dart';
import 'package:funny/pages/video-detail/index.dart';
import 'package:funny/pages/search/index.dart';

const routeArgs = {};
class FRoutes {
  static final routes = <String, WidgetBuilder>{
    '/': (BuildContext context) => App(),
  };

  static final routers = <String, dynamic>{
    'videoDetail': (arguments) => VideoDetail(
          routeArgs: arguments,
        ),
    'search': (arguments) => Search(
          routeArgs: arguments,
        )
  };

  static final RouteFactory? onGenerateRoute = (settings) {
    String name = settings.name.toString();
    print(name);
    bool isInRouters =
        FRoutes.routers.keys.toList().indexOf(name, 0) < 0 ? false : true;
    if (isInRouters)
      return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              FRoutes.routers[name](settings.arguments),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1, 0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ));
  };

  static final RouteFactory? onUnknownRoute = (RouteSettings settings) {
    return MaterialPageRoute(builder: (context) {
      return Text('404');
    });
  };
}
