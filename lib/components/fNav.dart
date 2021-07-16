import 'package:flutter/material.dart';

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
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Icon(
            Icons.radar_rounded,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
