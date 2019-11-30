import 'package:flutter/material.dart';

import 'package:flutter_util/flutter_util.dart';

class MyFutureBuilderRoute extends StatefulWidget {
  @override
  _MyFutureBuilderRouteState createState() => _MyFutureBuilderRouteState();
}

class _MyFutureBuilderRouteState extends State<MyFutureBuilderRoute> {

	var future;
	
	@override
	void initState() {
		super.initState();
		future = Future.delayed(Duration(seconds: 5,), () => "ok");
	}
	
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('my_future_builder'),
      ),
	    body: MyFutureBuilder(
		    future: future,
		    childBuilder: (context, data){
		    	return Center(child: Text(data),);
		    },
	    ),
    );
  }
  
}