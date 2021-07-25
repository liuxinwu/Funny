import 'package:flutter/material.dart';

class FVideoCard extends StatelessWidget {
  FVideoCard(
      {Key? key,
      required this.url,
      required this.id,
      this.name = '1',
      this.desc = '2',
      double this.maxHeight = 160.0})
      : super(key: key);

  final String url;
  final String name;
  final String desc;
  final int id;
  final maxHeight;

  Image generateImage(BuildContext context) {
    return url == ''
        ? Image.asset(
            "lib/images/logo.png",
            width: MediaQuery.of(context).size.width,
          )
        : Image.network(
            url,
            fit: BoxFit.fitWidth,
            width: MediaQuery.of(context).size.width,
          );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              constraints: BoxConstraints(
                maxHeight: maxHeight,
              ),
              child: generateImage(context),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  height: 2,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                desc,
                style: TextStyle(
                    fontSize: 10,
                    color: Color.fromRGBO(153, 153, 153, 1),
                    height: 1.3),
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
        onTap: () {
          Navigator.pushNamed(context, 'videoDetail',
              arguments: {'videoId': id});
        });
  }
}
