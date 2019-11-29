import 'package:flutter/material.dart';

import 'package:flutter_util/flutter_util.dart' show Logger;

class LogRoute extends StatefulWidget {
  @override
  _LogRouteState createState() => _LogRouteState();
}

class _LogRouteState extends State<LogRoute> {

	String TAG = "LogRoute";
	String text;



	@override
	void initState() {
		super.initState();
		text = "";
	}

	@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('日志输出'),
      ),
	    body: ListView(
		    children: <Widget>[
		    	Row(
				    mainAxisAlignment: MainAxisAlignment.spaceAround,
				    children: <Widget>[
				    	RaisedButton(
						    child: Text("i 日志"),
						    onPressed: (){
						    	String i = "正在打印 i 日志\n";
						    	Logger.i(i, TAG);
						    	setState(() {
						    	  text = text + i;
						    	});
						    },
					    ),
					    RaisedButton(
						    child: Text("e 日志"),
						    onPressed: (){
							    String e = "正在打印 e 日志\n";
							    Logger.e(e, TAG);
							    setState(() {
								    text = text + e;
							    });
						    },
					    ),
				    ],
			    ),
			    Text(
				    "提示：若为debug模式，请在 Debug - Console 中查看日志，若为release模式，则不打印日志",
				    style: TextStyle(color: Colors.red),
			    ),
			    Text(text),
		    ],
	    ),
    );
  }
}