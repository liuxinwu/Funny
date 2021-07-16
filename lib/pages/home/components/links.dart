import 'package:flutter/material.dart';
import 'package:funny/components/fNav.dart';
import 'package:funny/components/FVideoCard.dart';

class Links extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        FNav(),
    Scrollbar(
    controller: ScrollController(initialScrollOffset: 0),
    child: SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    padding: EdgeInsets.all(8),
    child: Text('video card'),))
      ],
    );
  }
}