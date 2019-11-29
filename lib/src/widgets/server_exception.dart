import 'package:flutter/material.dart';

import '../../r.dart';

class ServerException extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Container(
			width: double.infinity,
			height: double.infinity,
			child: Column(
				mainAxisSize: MainAxisSize.min,
				crossAxisAlignment: CrossAxisAlignment.center,
				children: <Widget>[
					SizedBox(height: 80,),
					Image.asset(R.imagesServerExceptionPng, height: 150,),
					Text("网络或服务器异常", style: TextStyle(color: Colors.grey[600]),),
				],
			),
		);
	}
}
