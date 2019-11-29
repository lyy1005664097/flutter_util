import 'package:flutter/material.dart';

import '../../r.dart';

class Error extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Container(
			alignment: Alignment.topCenter,
			padding: EdgeInsets.only(top: 80),
			child: Image.asset(R.imagesErrorPng, height: 150,),
		);
	}
}
