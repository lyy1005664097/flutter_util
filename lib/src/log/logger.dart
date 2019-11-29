import 'package:flutter/foundation.dart';

///
/// 日志输出工具类
/// kReleaseMode是Dart提供了一个布尔常量，可用来判断是否Release模式。
/// 在debug模式下，会打印日志，release模式下，不会打印日志。
class Logger{

	static const String TAG = "TAG";

	///info级别的日志
	static void i(dynamic o, [String tag = TAG]){
		if(!kReleaseMode){
			_printLog(tag, "i", o);
		}
	}

	///error级别的日志
	static void e(dynamic o, [String tag = TAG]){
		if(!kReleaseMode){
			_printLog(tag, "e", o);
		}
	}

	static void _printLog(String tag, String s, dynamic o){
		String content = '''${DateTime.now().toString().substring(0, 19)} : Logger[${_getType(s)}]: $tag, ${o.toString()}''';
		print(content);
	}

	static String _getType(String s){
		switch(s){
			case "i":
				return "INFO";
			case "e":
				return "ERROR";
			default:
				return s;
		}
	}
}