import 'package:flutter/material.dart';
import '/components/fStatusBar.dart';

import './components/head.dart';
import './components/history.dart';
import './components/list.dart';

class Search extends StatelessWidget {
  Search({required this.routeArgs});

  final Map routeArgs;

  Widget generateWidget() {
    return Container(
      padding: EdgeInsets.all(16),
      child: List(),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        FStatusBar(),
        Head(),
        generateWidget()
      ],),
    );
  }
}