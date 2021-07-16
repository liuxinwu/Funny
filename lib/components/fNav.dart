import 'package:flutter/material.dart';
import 'package:funny/utils/iconfont.dart';

class FNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '猜你喜欢',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          Icon(
            FIcons.gt,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
