import 'package:flutter/material.dart';

class VideoInfo extends StatelessWidget {
  VideoInfo({required this.data});

  final Map data;

  TextStyle getStyle() {
    return TextStyle(fontSize: 14, height: 1.5);
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          (data['vod_pic'] != null)
              ? Image.network(
                  data['vod_pic'],
                  width: 180,
                )
              : Image.asset('lib/images/logo.png', width: 180),
          SizedBox(
            width: 10,
          ),
          Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data['vod_name'] ?? '',
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold, height: 2),
                  ),
                  Text('主演：${data['vod_actor']}', style: getStyle()),
                  Text('导演：${data['vod_director']}', style: getStyle()),
                  Text('地区：${data['vod_area']}', style: getStyle()),
                  Text('时间：${data['vod_time']}', style: getStyle()),
                  Text('类型：${data['vod_class']}', style: getStyle()),
                  Text('语言：${data['vod_lang']}', style: getStyle())
                ],
              ))
        ],
      ),
    );
  }
}
