import 'package:flutter/material.dart';

import 'package:oktoast/oktoast.dart';
import 'package:flutter_util/flutter_util.dart' show isInsideChina;

class InChinaRoute extends StatefulWidget {
  @override
  _InChinaRouteState createState() => _InChinaRouteState();
}

class _InChinaRouteState extends State<InChinaRoute> {

  TextEditingController latController;
  TextEditingController lngController;
  bool result;

  @override
  void initState() {
    super.initState();
    latController = TextEditingController(text: "32.12345678");
    lngController = TextEditingController(text: "114.12345678");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: ListView(
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
          RaisedButton(
            child: Text("检测坐标点"),
            onPressed: (){
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
              result = isInsideChina(lat, lng);
              setState(() {

              });
            },
          ),
          Offstage(
            offstage: result == null,
            child: Text(
                result == null
                ? ""
                : result
                  ? "坐标点在中国"
                  : "坐标点不在中国"
            ),
          )
        ],
      ),
    );
  }
}