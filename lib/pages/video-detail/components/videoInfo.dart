import 'package:flutter/material.dart';

class VideoInfo extends StatelessWidget {
  TextStyle getStyle() {
    return TextStyle(fontSize: 14, height: 1.5);
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            'https://cms.daxjgxx.com//upload//vod//20210716-1//743f14a4c3c23caf4505a34d236d3f8f.jpg',
            width: 180,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '火药奶昔',
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold, height: 2),
                  ),
                  Text('主演：凯伦·吉兰 琳娜·海蒂 卡拉·古奇诺 杨紫琼 安吉拉·贝塞特 保罗·吉亚玛提 拉尔夫·伊内森 弗蕾娅',
                      style: getStyle()),
                  Text('导演：纳沃特·帕普莎多', style: getStyle()),
                  Text('地区：法国 美国 德国 ', style: getStyle()),
                  Text('时间：2021-07-16', style: getStyle()),
                  Text('类型：动作 惊悚 冒险 动作片', style: getStyle()),
                  Text('语言：英语', style: getStyle())
                ],
              ))
        ],
      ),
    );
  }
}
