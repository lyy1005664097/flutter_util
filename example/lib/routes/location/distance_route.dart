import 'package:flutter/material.dart';

import 'package:oktoast/oktoast.dart';
import 'package:flutter_util/flutter_util.dart';

class DistanceRoute extends StatefulWidget {
  @override
  _DistanceRouteState createState() => _DistanceRouteState();
}

class _DistanceRouteState extends State<DistanceRoute> {

	TextEditingController firstLatController;
	TextEditingController firstLngController;
	TextEditingController secondLatController;
	TextEditingController secondLngController;

	String distance;

	@override
	void initState() {
		super.initState();
		firstLatController = TextEditingController(text: "32.0");
		firstLngController = TextEditingController(text: "114.0");
		secondLatController = TextEditingController(text: "33.0");
		secondLngController = TextEditingController(text: "115.0");
		distance = "";
	}

	@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('测直线距离'),
      ),
	    body: ListView(
		    children: <Widget>[
		    	Text("第一个点坐标："),
			    TextField(
				    controller: firstLatController,
				    decoration: InputDecoration(
						    labelText: "纬度",
						    contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 5)
				    ),
			    ),
			    TextField(
				    controller: firstLngController,
				    decoration: InputDecoration(
						    labelText: "经度",
						    contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 5)
				    ),
			    ),
			    Container(height: 20,),
			    Text("第二个点坐标："),
			    TextField(
				    controller: secondLatController,
				    decoration: InputDecoration(
						    labelText: "纬度",
						    contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 5)
				    ),
			    ),
			    TextField(
				    controller: secondLngController,
				    decoration: InputDecoration(
						    labelText: "经度",
						    contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 5)
				    ),
			    ),
			    Container(height: 20,),
			    RaisedButton(
				    child: Text("测距"),
				    onPressed: (){
					    if(firstLatController.text.trim() == ""){
						    showToast("第一点纬度不能为空");
						    return;
					    }
					    if(firstLngController.text.trim() == ""){
						    showToast("第一点经度不能为空");
						    return;
					    }
					    if(secondLatController.text.trim() == ""){
						    showToast("第二点纬度不能为空");
						    return;
					    }
					    if(secondLngController.text.trim() == ""){
						    showToast("第二点经度不能为空");
						    return;
					    }
					    double firstLat = double.tryParse(firstLatController.text);
					    double firstLng = double.tryParse(firstLngController.text);
					    double secondLat = double.tryParse(secondLatController.text);
					    double secondLng = double.tryParse(secondLngController.text);
					    distance = Distance.getDirectDistance(firstLng, firstLat, secondLng, secondLat).toStringAsFixed(3);
					    setState(() {

					    });
				    },
			    ),
			    Text("直线距离：$distance 千米"),
		    ],
	    ),
    );
  }
}