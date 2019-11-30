import 'package:flutter/material.dart';

import 'package:flutter_util/flutter_util.dart';

class SeparatorRoute extends StatelessWidget {
	GlobalKey key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('separator'),
      ),
	    body: Column(
	      children: <Widget>[
		      Separator.dash(),
		      Separator(
			      width: 20,
			      height: 20,
			      blank: 0,
			      child: Icon(Icons.android, color: Colors.green, size: 20,),
		      ),
		      Separator(
			      width: 6,
			      height: 20,
			      blank: 0,
			      child: Text("*", style: TextStyle(fontSize: 14),),
		      ),
		      Separator(
			      width: 20,
			      height: 20,
			      blank: 0,
			      child: Image.asset("images/gou.png"),
		      ),
	      ],
	    ),
    );
  }
}