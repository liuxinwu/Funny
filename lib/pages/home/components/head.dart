import 'package:flutter/material.dart';
import '/utils/iconfont.dart';

class Head extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        color: Theme.of(context).primaryColor,
        child: Padding(
          padding: EdgeInsets.only(left: 8, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.asset(
                  "lib/images/logo.png",
                  width: 24,
                ),
              ),
              new Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                  child: Row(
                    children: [
                      Padding(
                        child: Icon(Icons.search, color: Colors.white60, size: 16,),
                        padding: EdgeInsets.only(right: 5),
                      ),
                      Text(
                        '三生三世十里桃花',
                        style: TextStyle(color: Colors.white60, fontSize: 14),
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
                  child: Icon(FIcons.recording, size: 25)),
              Icon(
                FIcons.download,
                size: 25,
              )
            ],
          ),
        ));
  }
}
