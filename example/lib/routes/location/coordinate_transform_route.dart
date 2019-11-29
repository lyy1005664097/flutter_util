import 'package:flutter/material.dart';

import 'package:oktoast/oktoast.dart';
import 'package:flutter_util/flutter_util.dart';

class CoordinateTransformRoute extends StatefulWidget {
  @override
  _CoordinateTransformRouteState createState() => _CoordinateTransformRouteState();
}

class _CoordinateTransformRouteState extends State<CoordinateTransformRoute> {

	TextEditingController latController;
	TextEditingController lngController;

	List<String> methods = [
		"gcj02 -> wgs84",
		"wgs84 -> gcj02",
		"bd09 -> wgs84",
		"wgs84 -> bd09",
		"gcj02 -> bd09",
		"bd09 -> gcj02"
	];
	String dropdownValue;
	String toLat;
	String toLng;

	@override
	void initState() {
		super.initState();
		latController = TextEditingController(text: "32.12345678");
		lngController = TextEditingController(text: "114.12345678");
		dropdownValue = methods[0];
		toLat = "";
		toLng = "";
	}

	@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('坐标转换'),
      ),
	    body: Column(
		    children: <Widget>[
		    	TextField(
				    controller: latController,
				    decoration: InputDecoration(
					    labelText: "纬度",
					    contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 5)
				    ),
			    ),
			    TextField(
				    controller: lngController,
				    decoration: InputDecoration(
						    labelText: "经度",
						    contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 5)
				    ),
			    ),
			    DropdownButton(
				    value: dropdownValue,
				    items: methods.map((method){
					    return DropdownMenuItem<String>(
						    value: method,
						    child: Text(method),
					    );
				    }).toList(),
				    onChanged: (String newValue) {
				    	setState(() {
				    		dropdownValue = newValue;
		          });
		        },
			    ),
			    RaisedButton(
				    child: Text("转换"),
				    onPressed: _transform,
			    ),
			    Text("纬度：$toLat"),
			    Text("经度：$toLng"),
		    ],
	    )
    );
  }

  void _transform(){
		if(latController.text.trim() == ""){
			showToast("纬度不能为空");
			return;
		}
		if(latController.text.trim() == ""){
			showToast("经度不能为空");
			return;
		}
		double lat = double.tryParse(latController.text);
		double lng = double.tryParse(lngController.text);
		List<double> location;
		switch(dropdownValue){
			case "gcj02 -> wgs84":
				location = CoordinateTransform.gcj02towgs84(lng, lat);
				break;
			case "wgs84 -> gcj02":
				location = CoordinateTransform.wgs84togcj02(lng, lat);
				break;
			case "bd09 -> wgs84":
				location = CoordinateTransform.bd09towgs84(lng, lat);
				break;
			case "wgs84 -> bd09":
				location = CoordinateTransform.wgs84tobd09(lng, lat);
				break;
			case "gcj02 -> bd09":
				location = CoordinateTransform.gcj02tobd09(lng, lat);
				break;
			case "bd09 -> gcj02":
				location = CoordinateTransform.bd09togcj02(lng, lat);
				break;
		}
		setState(() {
		  toLat = location[1].toStringAsFixed(8);
		  toLng = location[0].toStringAsFixed(8);
		});
  }
}