import 'package:flutter/material.dart';

class My extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Text('My'),
        onTap: () {
          Navigator.pushNamed(context, '/detail');
        },
      ),
    );
  }
}
