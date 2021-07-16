import 'package:flutter/material.dart';
import '/utils/iconfont.dart';

class Head extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 48,
        color: Theme.of(context).primaryColor,
        child: Padding(
          padding: EdgeInsets.only(left: 8, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(28),
                child: Image.asset(
                  "lib/images/logo.png",
                  width: 28,
                ),
              ),
              new Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Row(
                    children: [
                      Padding(
                        child: Icon(Icons.search, color: Colors.white60),
                        padding: EdgeInsets.only(right: 5),
                      ),
                      Text(
                        '三生三世十里桃花',
                        style: TextStyle(color: Colors.white60, fontSize: 16),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    border: Border.all(width: 1, color: Colors.white10),
                    borderRadius: new BorderRadius.all(
                      const Radius.circular(8.0),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Icon(FIcons.recording, size: 30)),
              Icon(
                FIcons.download,
                size: 30,
              )
            ],
          ),
        ));
  }
}
