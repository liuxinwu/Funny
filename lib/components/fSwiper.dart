import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class FSwiper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Swiper(
      itemBuilder: (BuildContext context, int index) {
        return new Image.network(
          "https://liangcang-material.alicdn.com/prod/upload/9d03bc5ccc5c471bb096ba21f3173f48.jpg?x-oss-process=image/resize,w_750/interlace,1",
          fit: BoxFit.fill,
        );
      },
      itemCount: 3,
      pagination: new SwiperPagination(),
      // control: new SwiperControl(),
    );
  }
}
