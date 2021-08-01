import 'package:flutter/material.dart';

class Head extends StatefulWidget {
  Head();

  @override
  _Head createState() => _Head();
}

class _Head extends State<Head> {
  handleChanged(String val) {
    print(val);
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      height: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search,
            color: Color.fromRGBO(153, 153, 153, 1),
            size: 20,
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              onChanged: handleChanged,
              decoration: InputDecoration(border: InputBorder.none),
            ),
          )),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.audiotrack,
              color: primaryColor,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              '取消',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: .5, color: Color.fromRGBO(235, 235, 235, 1)))),
    );
  }
}
