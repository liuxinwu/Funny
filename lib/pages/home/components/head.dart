import 'package:flutter/material.dart';
import '/utils/iconfont.dart';

class Head extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
            height: 60,
            color: Color.fromARGB(255, 217, 70, 59),
            child: Padding(
              padding: EdgeInsets.only(left: 8, right: 8, top: 10, bottom: 10),
              child: Row(
                children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      // https://blog.csdn.net/jking54/article/details/97822285 图片圆角的实现方案
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset("lib/images/logo.png", width: 32,),
                      )),
                  new Expanded(
                    child: Container(
                      height: 100,
                      child: Row(children: [
                        Padding(child: Icon(Icons.search, color: Colors.white60), padding: EdgeInsets.only(left: 10, right: 5),),
                        Text('三生三世十里桃花', style: TextStyle(color: Colors.white60, fontSize: 16),)
                      ],),
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
                      padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                      child: Icon(FIcons.recording, size: 30)),
                  Icon(FIcons.download, size: 30,)
                ],
              ),
            ));
  }
}