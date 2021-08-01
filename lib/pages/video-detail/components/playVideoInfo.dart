import 'package:flutter/material.dart';
import 'package:funny/utils/iconfont.dart';

class PlayVideoInfo extends StatelessWidget {
  PlayVideoInfo({required this.data});

  final Map data;

  // 简介信息
  _showModalBottomSheet(BuildContext context) {
    final vodTotal = data['vodTotal'] ?? 0;
    final vodArea = data['vodArea'] ?? 0;
    final vodYear = data['vodYear'] ?? 0;
    final vodClass = data['vodClass']?.replaceAll(RegExp(r','), '/') ?? '';
    final List vodActor = data['vodActor']?.split(',') ?? '';

    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Scrollbar(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data['vodName'] ?? '',
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold, height: 2),
                  ),
                  Text(
                    '全 $vodTotal 集',
                    style: TextStyle(
                        color: Color.fromRGBO(132, 132, 148, 1),
                        fontSize: 12,
                        height: 2),
                  ),
                  Text(
                    '$vodArea $vodYear $vodClass',
                    style: TextStyle(
                        color: Color.fromRGBO(132, 132, 148, 1),
                        fontSize: 12,
                        height: 2),
                  ),
                  Scrollbar(
                      child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: vodActor
                                .map((actor) => Column(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(70),
                                          child: Image.asset(
                                              'lib/images/logo.png',
                                              width: 70,
                                              centerSlice: Rect.largest),
                                        ),
                                        Text(actor,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    132, 132, 148, 1),
                                                fontSize: 12,
                                                height: 1.5))
                                      ],
                                    ))
                                .toList(),
                          ))),
                  Text(
                    '简介',
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold, height: 2),
                  ),
                  Text(
                    data['vodContent'] ?? '',
                    style: TextStyle(
                        color: Color.fromRGBO(132, 132, 148, 1),
                        fontSize: 12,
                        height: 2),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final vodScore = data['vodScore'] ?? 0;
    final vodTotal = data['vodTotal'] ?? 0;
    final vodHits = data['vodHits'] ?? 0;
    final updateCollection = data['vodPlayUrl']?.length ?? 0;
    final vodUp = data['vodUp'] ?? 0;
    final primaryColor = Theme.of(context).primaryColor;

    return ListBody(
      children: [
        Text(
          data['vodName'] ?? '',
          style:
              TextStyle(fontSize: 18, fontWeight: FontWeight.bold, height: 1.5),
        ),
        Padding(
          padding: EdgeInsets.only(top: 5, bottom: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '$vodScore 分',
                style: TextStyle(
                    color: Color.fromRGBO(132, 132, 148, 1),
                    fontSize: 12,
                    height: 1.5),
              ),
              Text(
                ' · ',
                style: TextStyle(
                  color: Color.fromRGBO(132, 132, 148, 1),
                  fontSize: 12,
                  height: 1.5,
                ),
              ),
              Text(
                'VIP',
                style:
                    TextStyle(color: primaryColor, fontSize: 12, height: 1.5),
              ),
              Text(
                ' · 更新至$updateCollection集 · 全$vodTotal集 · $vodHits次播放',
                style: TextStyle(
                    color: Color.fromRGBO(132, 132, 148, 1),
                    fontSize: 12,
                    height: 1.5),
              ),
              GestureDetector(
                onTap: () async {
                  _showModalBottomSheet(context);
                },
                child: Text(' · 简介 >',
                    style: TextStyle(
                        color: Colors.blue, fontSize: 12, height: 1.5)),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 5, bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Icon(
                    FIcons.likes,
                    color: Color.fromRGBO(34, 34, 34, 1),
                  ),
                  Text(
                    ' $vodUp+',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      height: 1.5,
                    ),
                  )
                ],
              ),
              Wrap(
                spacing: 10,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Icon(
                    FIcons.collection,
                    size: 18,
                    color: Color.fromRGBO(34, 34, 34, 1),
                  ),
                  Icon(
                    FIcons.download,
                    size: 24,
                    color: Color.fromRGBO(34, 34, 34, 1),
                  ),
                  Icon(
                    FIcons.share,
                    color: Color.fromRGBO(34, 34, 34, 1),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
