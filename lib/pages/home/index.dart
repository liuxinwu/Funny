import 'package:flutter/material.dart';
import '/api/cmsApi.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Text('Home'),
        onTap: () async {
          final res = await CmsApi.getList(queryParameters: {'ac': 'list', 'pg': 2 });
          print('index.dart');
          print(res.data);
        },
      ),
    );
  }
}
