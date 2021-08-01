import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FVideoCard extends StatelessWidget {
  FVideoCard(
      {Key? key,
      required this.url,
      required this.id,
      this.name = '',
      this.subName = '',
      this.maxHeight = 160.0,
      this.jumpMethod})
      : super(key: key);

  final String url;
  final String name;
  final String subName;
  final int id;
  final double maxHeight;
  final jumpMethod;

  ClipRRect generateImage(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: CachedNetworkImage(
        width: double.infinity,
        imageUrl: url,
        fit: BoxFit.cover,
        placeholder: (context, url) => Image.asset('lib/images/logo.png'),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
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
              constraints: BoxConstraints(maxHeight: maxHeight),
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
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, bottom: 5),
              child: Text(
                subName,
                // textWidthBasis: TextWidthBasis.values,
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
          if (jumpMethod != null) {
            jumpMethod({'videoId': id});
            return;
          }
          Navigator.pushNamed(context, 'videoPlayPage',
              arguments: {'videoId': id});
        });
  }
}
