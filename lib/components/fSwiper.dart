import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class FSwiper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Swiper(
      itemBuilder: (BuildContext context, int index) {
        return new Image.network(
          "https://cms.daxjgxx.com//upload//vod//20210716-1//743f14a4c3c23caf4505a34d236d3f8f.jpg",
          fit: BoxFit.fitWidth,
        );
      },
      itemCount: 3,
      pagination: new SwiperPagination(),
      // control: new SwiperControl(),
    );
  }
}
