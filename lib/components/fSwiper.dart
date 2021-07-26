import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class FSwiper extends StatelessWidget {
  final List swiperList = [
    'https:\/\/img.52swat.cn\/upload\/vod\/20210720-1\/c55537d557e1b40733e4d236fefafa95.jpg',
    'https://cms.daxjgxx.com//upload//vod//20210716-1//743f14a4c3c23caf4505a34d236d3f8f.jpg',
    'https:\/\/img.52swat.cn\/upload\/vod\/20210724-1\/cfe67ec19df51727e8adfe3e92f66b71.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return new Swiper(
      itemBuilder: (BuildContext context, int index) {
        return CachedNetworkImage(
          imageUrl: swiperList[index],
          fit: BoxFit.fitWidth,
          placeholder: (context, url) => Image.asset('lib/images/logo.png'),
          errorWidget: (context, url, error) => Icon(Icons.error),
        );
      },
      itemCount: swiperList.length,
      pagination: new SwiperPagination(alignment: Alignment.bottomRight),
      layout: SwiperLayout.CUSTOM,
      customLayoutOption: new CustomLayoutOption(startIndex: -1, stateCount: 3)
          .addRotate([-45.0 / 180, 0.0, 45.0 / 180]).addTranslate([
        new Offset(-(width - 50.0), 0.0),
        new Offset(20, 0.0),
        new Offset(width - 10, 40.0)
      ]),
      itemWidth: width,
      // itemHeight: width * .6,
    );
  }
}
