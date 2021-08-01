import 'package:flutter/material.dart';

class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListBody(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('历史搜索', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
          Icon(
            Icons.delete,
            color: Colors.black54,
          )
        ]),
        SizedBox(height: 10,),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 3, horizontal: 8),
              color: Color.fromRGBO(237, 240, 247, 1.0),
              child: Text('你是我的荣耀'),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 3, horizontal: 8),
              color: Color.fromRGBO(237, 240, 247, 1.0),
              child: Text('北辙南辕'),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 3, horizontal: 8),
              color: Color.fromRGBO(237, 240, 247, 1.0),
              child: Text('2021 CBA总决赛'),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 3, horizontal: 8),
              color: Color.fromRGBO(237, 240, 247, 1.0),
              child: Text('2021 CBA总决赛'),
            ),
          ],
        )
      ],
    );
  }
}
