import 'package:flutter/material.dart';

import 'package:flutter_util/flutter_util.dart';

class MyTabBarRoute extends StatefulWidget {
  @override
  _MyTabBarRouteState createState() => _MyTabBarRouteState();
}

class _MyTabBarRouteState extends State<MyTabBarRoute> with SingleTickerProviderStateMixin{

	List<String> tabs = ["语文", "数学", "英语"];
	TabController controller;

	@override
	void initState() {
		// TODO: implement initState
		super.initState();
		controller = TabController(length: tabs.length, vsync: this);
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('my_tab_bar'),
			),
			body: Scaffold(
				appBar: MyTabBar(
					controller: controller,
					tabs: tabs.map((e){
						return Center(
							child: Text(e, style: TextStyle(color: Colors.black),),
						);
					}).toList(),
				),
			)
		);
	}

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

}