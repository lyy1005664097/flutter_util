import 'package:flutter/material.dart';

import 'package:oktoast/oktoast.dart';
import 'package:flutter_util/flutter_util.dart';

class PermissionRoute extends StatefulWidget {
  @override
  _PermissionRouteState createState() => _PermissionRouteState();
}

class _PermissionRouteState extends State<PermissionRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: ListView(
        children: <Widget>[
          RaisedButton(
            child: Text("申请单个权限，无回调"),
            onPressed: (){
              requestPermission([PermissionGroup.location]);
            },
          ),
          RaisedButton(
            child: Text("申请单个权限,有回调"),
            onPressed: ()async{
              await requestPermission(
                [PermissionGroup.camera],
                onFailed: (){
                    showToast("申请权限失败");
                }
              );
            },
          ),
          RaisedButton(
            child: Text("申请多个个权限，无回调"),
            onPressed: (){
              requestPermission([PermissionGroup.location, PermissionGroup.storage]);
            },
          ),
          RaisedButton(
            child: Text("申请多个个权限，有回调"),
            onPressed: (){
              requestPermission(
                [PermissionGroup.location, PermissionGroup.storage],
                  onFailed: (){
                    showToast("申请权限失败");
                  }
              );
            },
          ),
          Text(
            "提示：android需要在AndroidManif.xml中配置相关权限，ios需要在info.plist中配置相关权限",
            style: TextStyle(color: Colors.red),
          )
        ],
      ),
    );
  }
}