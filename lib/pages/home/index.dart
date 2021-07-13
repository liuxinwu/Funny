import 'package:flutter/material.dart';
import '/api/cmsApi.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 375,
          height: 48,
          child: Row(
            children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 10, 5),
                  child: Icon(Icons.search)),
              new Expanded(
                child: Text('Funny'),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Icon(Icons.download)),
              Icon(Icons.settings)
            ],
          ),
        ),
        new Expanded(child: Center(
          child: GestureDetector(
            child: Text('Home'),
            onTap: () async {
              final res = await CmsApi.getList(
                  queryParameters: {'ac': 'list', 'pg': 2});
              print('index.dart');
              print(res.data);
            },
          ),
        ),)
        
      ],
    );
  }
}
