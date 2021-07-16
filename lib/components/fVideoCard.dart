import 'package:flutter/material.dart';

class FVideoCard extends StatelessWidget {
  FVideoCard({Key? key, required String this.url}) : super(key: key);

  final url;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.network(
          url,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            '我的邻居长不大',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Colors.black,
              height: 2,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            '年下小狼狗追御姐',
            style: TextStyle(
                fontSize: 13,
                color: Color.fromRGBO(153, 153, 153, 1),
                height: 1.3),
          ),
        )
      ],
    );
  }
}
