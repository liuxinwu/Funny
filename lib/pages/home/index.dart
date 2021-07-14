import 'package:flutter/material.dart';
import '/api/cmsApi.dart';
import './components/head.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Head(),
        new Expanded(
          child: Center(
            child: GestureDetector(
              child: Text('Home'),
              onTap: () async {
                final res = await CmsApi.getList(
                    queryParameters: {'ac': 'list', 'pg': 2});
                print('index.dart');
                print(res.data);
              },
            ),
          ),
        )
      ],
    );
  }
}
