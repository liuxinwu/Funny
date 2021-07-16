import 'package:flutter/material.dart';

class FNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('猜你喜欢', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),),
        Icon(Icons.mail, color: Colors.black,)
      ],
    ),);
  }
}