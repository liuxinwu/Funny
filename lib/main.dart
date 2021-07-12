import 'package:flutter/material.dart';
import './router/routers.dart';
void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Funny',
      routes: routers
    );
  }
}

