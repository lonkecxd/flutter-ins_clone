import 'package:flutter/material.dart';
import 'package:ins_clone/insta_list.dart';

class InstaBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Flexible(child: new InstaList(),),
      ],
    );
  }
}
