import 'package:flutter/material.dart';

class List extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListBody(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text('你是我的荣耀'),
          decoration: BoxDecoration(border: Border(bottom: BorderSide(width: .5,color: Color.fromRGBO(235, 235, 235, 1)))),
        )
      ],
    );
  }
}
