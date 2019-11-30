import 'package:flutter/material.dart';

///异步请求数据时使用
class Waiting extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 22,
        height: 22,
        child: CircularProgressIndicator(strokeWidth: 2),
      ),
    );
  }

}