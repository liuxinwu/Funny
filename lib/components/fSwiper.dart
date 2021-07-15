import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class FSwiper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Swiper(
      itemBuilder: (BuildContext context, int index) {
        return new Image.network(
          "https://public-static-edu.codemao.cn/upload/1550226072000/%E5%B9%B3%E5%8F%B0%E8%A7%86%E9%A2%91banner2.png",
          fit: BoxFit.fill,
        );
      },
      itemCount: 3,
      pagination: new SwiperPagination(),
      // control: new SwiperControl(),
    );
  }
}
