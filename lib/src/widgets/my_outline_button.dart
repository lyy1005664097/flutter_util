import 'package:flutter/material.dart';

///自定义outlinebutton，按钮边框可以紧贴着按钮标签
class MyOutlineButton extends StatelessWidget{

	MyOutlineButton({
		Key key,
		@required this.onPressed,
		this.child,
		this.color,
		this.focusColor,
		this.hoverColor,
		this.highlightColor,
		this.splashColor,
		this.padding,
		this.disabledColor,
		this.radius,
		this.borderRadius,
		this.borderColor = const Color(0xFF000000),
		this.borderWidth = 1.0,
		this.borderStyle = BorderStyle.solid,
		this.icon,
		this.width,
		this.height,
		this.alignment,
	}): assert(borderColor != null),
		assert(borderWidth != null),
		assert(borderWidth >= 0.0),
		assert(borderStyle != null),
		super(key: key,);

	///按钮点击时的回调方法
	final VoidCallback onPressed;
	///按钮背景色
	final Color color;
	///按钮失效时的背景色
	final Color disabledColor;
	final Color splashColor;
	final Color focusColor;
	final Color hoverColor;
	final Color highlightColor;
	final Widget child;
	bool get enabled => onPressed != null;
	final EdgeInsetsGeometry padding;
	///按钮的点击效果，若radius为null，点击效果为溅墨模式，
	///反之，点击效果为以接触点为圆心，radius为半径的圆
	final double radius;
	///按钮的边框圆角
	BorderRadius borderRadius;
	///按钮的边框颜色
	final Color borderColor;
	///按钮的边框线宽
	final double borderWidth;
	///按钮边框的线的风格
	final BorderStyle borderStyle;
	Icon icon;
	///按钮的宽度
	final double width;
	///按钮的高度
	final double height;
	///按钮内部子组件的对齐方式
	final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {

    borderRadius = borderRadius ?? BorderRadius.circular(5);
    ShapeBorder shape = RoundedRectangleBorder(
	    side: BorderSide(
		    color: borderColor,
		    width: borderWidth,
		    style: borderStyle,
	    ),
	    borderRadius: borderRadius,
    );

    return Material(
	    color: enabled ? color : disabledColor,
	    shape: shape,
	    child: InkWell(
		    child: Padding(
			    padding: padding ?? EdgeInsets.all(5),
			    child: icon == null
					    ? Container(
		            width: width,
						    height: height,
						    child: child,
		            alignment: alignment,
					    )
					    : Row(
		            mainAxisSize: MainAxisSize.min,
		            mainAxisAlignment: MainAxisAlignment.center,
		            children: <Widget>[
		              icon,
			            child,
		            ],
	            ),
		    ),
		    onTap: onPressed,
		    focusColor: focusColor,
		    hoverColor:  hoverColor,
		    highlightColor: highlightColor,
		    splashColor: splashColor,
		    radius: radius,
		    borderRadius: borderRadius,
	    ),
    );
  }

}