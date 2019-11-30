import 'package:flutter/material.dart';

class Exception extends StatelessWidget {
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
					Icon(Icons.event_busy, size: 150, color: Colors.grey,),
				],
			),
		);
	}
}
