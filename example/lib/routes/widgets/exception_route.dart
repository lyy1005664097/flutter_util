import 'package:flutter/material.dart';

import 'package:flutter_util/flutter_util.dart' show Exception;

class ExceptionRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('exception'),
      ),
	    body: Exception(),
    );
  }
}