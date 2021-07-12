import 'package:flutter/material.dart';
import '/api/cmsApi.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Text('Home'),
        onTap: () async {
          print(cmsRequest['list']);
          // final res = await api.requst();
          // print(res);
        },
      ),
    );
  }
}
