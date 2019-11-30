import 'package:flutter/material.dart';

///分隔符
class Separator extends StatelessWidget {

	const Separator({
		Key key,
		this.width,
		this.height,
		this.blank,
		this.child,
		this.contentPadding
	}):super(key: key);

	///分隔符高
	final double height;
	///分隔符宽
	final double width;
	///分隔符的空白间隙
	final double blank;
	///分隔符
	final Widget child;
	///分隔符padding
	final EdgeInsetsGeometry contentPadding;

	///虚线
	static Separator dash({
		Key key,
		double width = 10,
		double height = 1,
		double blank = 10,
		EdgeInsetsGeometry contentPadding,
		Color color = Colors.black,
	}){
		return Separator(
			key: key,
			width: width,
			height: height,
			blank: blank,
			contentPadding: contentPadding,
			child: DecoratedBox(
				decoration: BoxDecoration(color: color),
			),
		);
	}

	@override
	Widget build(BuildContext context) {

		return LayoutBuilder(
			builder: (BuildContext context, BoxConstraints constraints) {
				final boxWidth = constraints.constrainWidth();
				final dashWidth = width ?? 10;
				final dashHeight = height ?? 10;
				final dashBlank = blank ?? 0;
				final dashCount = (boxWidth / (dashWidth + dashBlank)).floor();
				return Padding(
				  padding: contentPadding ?? const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
				  child: Flex(
				  	children: List.generate(dashCount, (_) {
				  		return SizedBox(
				  			width: dashWidth,
				  			height: dashHeight,
				  			child: ClipRRect(child: child),
				  		);
				  	}),
				  	mainAxisAlignment: MainAxisAlignment.spaceBetween,
				  	direction: Axis.horizontal,
				  ),
				);
			},
		);
	}
}