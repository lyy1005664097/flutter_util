import 'package:flutter/material.dart';

import 'package:flutter_util/flutter_util.dart' show Waiting;

class WaitingRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('waiting'),
      ),
	    body: Waiting(),
    );
  }
}