import 'package:flutter/material.dart';

import 'package:oktoast/oktoast.dart';

import 'package:example/routes/location/coordinate_transform_route.dart';
import 'package:example/routes/location/distance_route.dart';

import 'routes/location/in_china_route.dart';
import 'routes/log/log_route.dart';
import 'routes/permission/permission_route.dart';
import 'routes/widgets/my_future_builder_route.dart';
import 'routes/widgets/my_outline_button_route.dart';
import 'routes/widgets/my_tab_bar.dart';
import 'routes/widgets/separator_route.dart';
import 'routes/widgets/exception_route.dart';
import 'routes/widgets/waiting_route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp(
        title: 'Flutter Util Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: "/",
        routes: {
          "/": (context) => MyHomePage(),
          "coordinate_transformRoute": (context) => CoordinateTransformRoute(),
          "distance": (context) => DistanceRoute(),
          "in_china": (context) => InChinaRoute(),
          "log": (context) => LogRoute(),
          "permission": (context) => PermissionRoute(),
          "separator": (context) => SeparatorRoute(),
          "server_exception": (context) => ExceptionRoute(),
          "waiting": (context) => WaitingRoute(),
          "my_future_builder": (context) => MyFutureBuilderRoute(),
          "my_outline_button": (context) => MyOutlineButtonRoute(),
          "my_tab_bar": (context) => MyTabBarRoute(),
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Example"),
      ),
      body: ListView(
        children: <Widget>[
          ExpansionTile(
            title: Text("位置服务"),
            children: <Widget>[
              ListTile(
                title: Text("坐标转换"),
                trailing: Icon(Icons.arrow_forward_ios, size: 16,),
                onTap: (){
                  Navigator.of(context).pushNamed("coordinate_transformRoute");
                },
              ),
              ListTile(
                title: Text("测直线距离"),
                trailing: Icon(Icons.arrow_forward_ios, size: 16,),
                onTap: (){
                  Navigator.of(context).pushNamed("distance");
                },
              ),
              ListTile(
                title: Text("坐标点是否在中国"),
                trailing: Icon(Icons.arrow_forward_ios, size: 16,),
                onTap: (){
                  Navigator.of(context).pushNamed("in_china");
                },
              ),
            ],
          ),
          ListTile(
            title: Text("日志打印"),
            trailing: Icon(Icons.arrow_forward_ios, size: 16,),
            onTap: (){
              Navigator.of(context).pushNamed("log");
            },
          ),
          ListTile(
            title: Text("权限申请"),
            trailing: Icon(Icons.arrow_forward_ios, size: 16,),
            onTap: (){
              Navigator.of(context).pushNamed("permission");
            },
          ),
          ExpansionTile(
            title: Text("自定义组件"),
            children: <Widget>[
              ListTile(
                title: Text("my_future_builder"),
                trailing: Icon(Icons.arrow_forward_ios, size: 16,),
                onTap: (){
                  Navigator.of(context).pushNamed("my_future_builder");
                },
              ),
              ListTile(
                title: Text("my_outline_button"),
                trailing: Icon(Icons.arrow_forward_ios, size: 16,),
                onTap: (){
                  Navigator.of(context).pushNamed("my_outline_button");
                },
              ),
              ListTile(
                title: Text("my_separator"),
                trailing: Icon(Icons.arrow_forward_ios, size: 16,),
                onTap: (){
                  Navigator.of(context).pushNamed("separator");
                },
              ),
              ListTile(
                title: Text("my_tab_bar"),
                trailing: Icon(Icons.arrow_forward_ios, size: 16,),
                onTap: (){
                  Navigator.of(context).pushNamed("my_tab_bar");
                },
              ),
              ListTile(
                title: Text("exception"),
                trailing: Icon(Icons.arrow_forward_ios, size: 16,),
                onTap: (){
                  Navigator.of(context).pushNamed("server_exception");
                },
              ),
              ListTile(
                title: Text("waiting"),
                trailing: Icon(Icons.arrow_forward_ios, size: 16,),
                onTap: (){
                  Navigator.of(context).pushNamed("waiting");
                },
              ),
            ],
          ),
        ],
      )
    );
  }
}
