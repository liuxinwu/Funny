import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// 暂时简单封装下，可以自定义
const config = <String, dynamic>{
  'toastLength': Toast.LENGTH_LONG,
  'gravity': ToastGravity.CENTER,
  'timeInSecForIosWeb': 3,
  'backgroundColor': Colors.white,
  'textColor': Colors.black,
  'fontSize': 16.0,
  'webPosition': 'right'
};

class FToast {
  static showToast({required String msg}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: config['toastLength'],
        gravity: config['gravity'],
        timeInSecForIosWeb: config['timeInSecForIosWeb'],
        backgroundColor: config['backgroundColor'],
        textColor: config['textColor'],
        fontSize: config['fontSize'],
        webPosition: config['webPosition']);
  }

  static hiddenToast() {
    Fluttertoast.cancel();
  }
}
