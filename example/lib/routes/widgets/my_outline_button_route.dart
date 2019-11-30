import 'package:flutter/material.dart';

import 'package:flutter_util/flutter_util.dart';

class MyOutlineButtonRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('my_outline_button'),
      ),
	    body: ListView(
		    children: <Widget>[
		    	Padding(
		    	  padding: const EdgeInsets.all(8.0),
		    	  child: Row(
				      mainAxisAlignment: MainAxisAlignment.spaceAround,
					    children: <Widget>[
					    	Text("普通"),
					      MyOutlineButton(
							    child: Text("button", style: TextStyle(color: Colors.red),),
							    onPressed: (){},
						    ),
						    MyOutlineButton(
							    child: Text("button", style: TextStyle(color: Colors.red),),
							    onPressed: null,
						    ),
					    ],
				    ),
		    	),
			    Padding(
				    padding: const EdgeInsets.all(8.0),
				    child: Row(
					    mainAxisAlignment: MainAxisAlignment.spaceAround,
					    children: <Widget>[
						    Text("padding"),
						    MyOutlineButton(
							    child: Text("button"),
							    padding: EdgeInsets.all(10),
							    onPressed: (){},
						    ),
						    MyOutlineButton(
							    child: Text("button"),
							    padding: EdgeInsets.all(10),
							    onPressed: null,
						    ),
					    ],
				    ),
			    ),
			    Padding(
				    padding: const EdgeInsets.all(8.0),
				    child: Row(
					    mainAxisAlignment: MainAxisAlignment.spaceAround,
					    children: <Widget>[
						    Text("带宽、高"),
						    MyOutlineButton(
							    child: Text("button"),
							    padding: EdgeInsets.all(10),
							    width: 80,
							    height: 80,
							    alignment: Alignment.center,
							    borderRadius: BorderRadius.circular(10),
							    color: Colors.red,
							    borderColor: Colors.green,
							    disabledColor: Colors.yellow,
							    borderWidth: 10,
							    onPressed: (){},
						    ),
						    MyOutlineButton(
							    child: Text("button"),
							    padding: EdgeInsets.all(10),
							    width: 80,
							    height: 80,
							    alignment: Alignment.center,
							    borderRadius: BorderRadius.circular(10),
							//    color: Colors.red,
							//    borderColor: Colors.green,
							//    disabledColor: Colors.yellow,
							    borderWidth: 10,
							    onPressed: null,
						    ),
					    ],
				    ),
			    ),
			    Padding(
				    padding: const EdgeInsets.all(8.0),
				    child: Row(
					    mainAxisAlignment: MainAxisAlignment.spaceAround,
					    children: <Widget>[
						    Text("icon"),
						    MyOutlineButton(
							    child: Icon(Icons.android),
							    padding: EdgeInsets.all(10),
							    width: 80,
							    height: 80,
							    alignment: Alignment.center,
							    borderRadius: BorderRadius.circular(10),
							    color: Colors.red,
							    borderColor: Colors.green,
							    disabledColor: Colors.yellow,
							    borderWidth: 10,
							    onPressed: (){},
						    ),
						    MyOutlineButton(
							    child: Icon(Icons.android),
							    padding: EdgeInsets.all(10),
							    width: 80,
							    height: 80,
							    alignment: Alignment.center,
							    borderRadius: BorderRadius.circular(10),
							    color: Colors.red,
							    borderColor: Colors.green,
							    disabledColor: Colors.yellow,
							    borderWidth: 10,
							    onPressed: null,
						    ),
					    ],
				    ),
			    ),
			    Padding(
				    padding: const EdgeInsets.all(8.0),
				    child: Row(
					    mainAxisAlignment: MainAxisAlignment.spaceAround,
					    children: <Widget>[
						    Text("多children"),
						    MyOutlineButton(
							    child: Row(
								    children: <Widget>[
								    	Icon(Icons.android),
									    Text("安卓")
								    ],
							    ),
							    padding: EdgeInsets.all(10),
							    width: 80,
							    height: 80,
							    alignment: Alignment.center,
							    borderRadius: BorderRadius.circular(10),
							    color: Colors.red,
							    borderColor: Colors.green,
							    disabledColor: Colors.yellow,
							    borderWidth: 10,
							    onPressed: (){},
						    ),
						    MyOutlineButton(
							    child: Row(
								    children: <Widget>[
									    Icon(Icons.android),
									    Text("安卓")
								    ],
							    ),
							    padding: EdgeInsets.all(10),
							    width: 80,
							    height: 80,
							    alignment: Alignment.center,
							    borderRadius: BorderRadius.circular(10),
							    color: Colors.red,
							    borderColor: Colors.green,
							    disabledColor: Colors.yellow,
							    borderWidth: 10,
							    onPressed: null,
						    ),
					    ],
				    ),
			    ),
		    ],
	    ),
    );
  }
}