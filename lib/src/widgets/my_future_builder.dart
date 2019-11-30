import 'package:flutter/material.dart';

import 'exception.dart';
import 'waiting.dart';

typedef DataWidgetBuilder<T> = Widget Function(BuildContext context, T data);
typedef ErrorWidgetBuilder<T> = Widget Function(BuildContext context, Object error);

///异步获取数据构建组件
class MyFutureBuilder<T> extends StatelessWidget {

	const MyFutureBuilder({
		Key key,
		this.future,
		this.initialData,
		@required this.childBuilder,
		this.waitingBuilder,
		this.errorBuilder,
		this.noDataBuilder,
	}): super(key: key);

	///异步获取数据的方法
	final Future<T> future;

	///初始化数据
	final T initialData;

	///获取数据成功时的组件
	final DataWidgetBuilder childBuilder;

	///正在获取数据时的组件
	final WidgetBuilder waitingBuilder;

	///获取数据出错时显示的组件
	final ErrorWidgetBuilder errorBuilder;

	///获取数据为空时显示的组件
	final WidgetBuilder noDataBuilder;

	@override
	Widget build(BuildContext context) {
		return FutureBuilder<T>(
			future: future,
			initialData: initialData,
			builder: (BuildContext context, AsyncSnapshot<T> snapshot){
				Widget widget;
				if (snapshot.hasData) {
					if(snapshot.data == null){
						widget = noDataBuilder == null
							?  Exception()
							: noDataBuilder(context);
					}else{
						widget = childBuilder(context, snapshot.data);
					}
				} else if (snapshot.hasError){
					widget = errorBuilder == null
						? Exception()
						: errorBuilder(context, snapshot.error);
				}else{
					widget = waitingBuilder == null
						? Waiting()
						: waitingBuilder(context);
				}
				return widget;
			},
		);
	}
}
