import 'package:flutter/material.dart';
import '../icons/myIcons.dart';

class NoData extends StatelessWidget{

	@override
	Widget build(BuildContext context) {
		return Container(
			width: double.infinity,
			height: double.infinity,
			child: Column(
				mainAxisSize: MainAxisSize.min,
				crossAxisAlignment: CrossAxisAlignment.center,
				children: <Widget>[
					SizedBox(height: 100,),
					Icon(MyIcons.noData, color: Colors.grey[300], size: 100, ),
					Text("抱歉，暂时没有相关内容哦", style: TextStyle(color: Colors.grey[400]),),
				],
			),
		);
	}
}