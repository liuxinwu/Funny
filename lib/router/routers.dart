import 'package:flutter/material.dart';
import '/pages/app.dart';

final routers = <String, WidgetBuilder> {
  '/': (BuildContext context) => App(),
  '/detail': (BuildContext context) => Center(child: Text('detail'))
};
