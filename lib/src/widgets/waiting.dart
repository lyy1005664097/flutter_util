import 'package:flutter/material.dart';

class Waiting extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 22,
      height: 22,
      child: CircularProgressIndicator(strokeWidth: 2),
    );
  }

}