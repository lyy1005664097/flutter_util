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
		this.borderColor,
		this.borderWidth = 1.0,
		this.width,
		this.height,
		this.alignment,
	}):assert(borderWidth != null),
		assert(borderWidth >= 0.0),
		super(key: key,);

	///按钮点击时的回调方法
	final VoidCallback onPressed;
	///按钮背景色
	final Color color;
	///按钮失效时的背景色
	Color disabledColor;
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
	Color borderColor;
	///按钮的边框线宽
	final double borderWidth;
	///按钮的宽度
	final double width;
	///按钮的高度
	final double height;
	///按钮内部子组件的对齐方式
	final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {

	  disabledColor = disabledColor ?? Theme.of(context).disabledColor;
    borderRadius = borderRadius ?? BorderRadius.circular(5);
    ShapeBorder shape = RoundedRectangleBorder(
	    side: BorderSide(
		    color: borderColor
				    ?? (enabled
		          ? Theme.of(context).primaryColor
		          : disabledColor),
		    width: borderWidth,
		    style: BorderStyle.solid,
	    ),
	    borderRadius: borderRadius,
    );

    return Material(
	    color: color,
	    shape: shape,
	    child: InkWell(
		    child: Container(
			    padding: padding ?? EdgeInsets.all(5),
          width: width,
			    height: height,
			    child: DefaultTextStyle(
				    style: TextStyle(color: enabled ? Colors.black : disabledColor),
				    child: child,
			    ),
          alignment: alignment,
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