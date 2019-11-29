import 'dart:core';
import 'dart:math' as math;

import 'location.dart';

///
///百度坐标（BD09）、国测局坐标（火星坐标，GCJ02）、和WGS84坐标系之间的转换的工具
///
///@author
class CoordinateTransform {
	static const x_pi = 3.14159265358979324 * 3000.0 / 180.0;

	// π = 3.1415926535897932384626;
	static const pi = math.pi;

	// 长半轴
	static const a = 6378245.0;

	// 扁率
	static const ee = 0.00669342162296594323;

	///
	///百度坐标系(BD-09)转WGS坐标
	///
	/// @param lng 百度坐标纬度
	///@param lat 百度坐标经度
	/// @return WGS84坐标数组
	///
	static List<double> bd09towgs84(double lng, double lat) {
		List<double> gcj = bd09togcj02(lng, lat);
		List<double> wgs84 = gcj02towgs84(gcj[0], gcj[1]);
		return wgs84;
	}

	/// WGS坐标转百度坐标系(BD-09)
	/// @param lng WGS84坐标系的经度
	/// @param lat WGS84坐标系的纬度
	/// @return 百度坐标数组
	static List<double> wgs84tobd09(double lng, double lat) {
		List<double> gcj = wgs84togcj02(lng, lat);
		List<double> bd09 = gcj02tobd09(gcj[0], gcj[1]);
		return bd09;
	}

	/// 火星坐标系(GCJ-02)转百度坐标系(BD-09)
	/// @see /谷歌、高德——>百度
	/// @param lng 火星坐标经度
	/// @param lat 火星坐标纬度
	/// @return 百度坐标数组
	static List<double> gcj02tobd09(double lng, double lat) {
		double z = math.sqrt(lng * lng + lat * lat) +
				0.00002 * math.sin(lat * x_pi);
		double theta = math.atan2(lat, lng) + 0.000003 * math.cos(lng * x_pi);
		double bdlng = z * math.cos(theta) + 0.0065;
		double bdlat = z * math.sin(theta) + 0.006;
		return [bdlng, bdlat];
	}

	/// 百度坐标系(BD-09)转火星坐标系(GCJ-02)
	/// @see /百度——>谷歌、高德
	/// @param /lng 百度坐标纬度
	/// @param /lat 百度坐标经度
	/// @return 火星坐标数组
	static List<double> bd09togcj02(double bdlon, double bdlat) {
		double x = bdlon - 0.0065;
		double y = bdlat - 0.006;
		double z = math.sqrt(x * x + y * y) - 0.00002 * math.sin(y * x_pi);
		double theta = math.atan2(y, x) - 0.000003 * math.cos(x * x_pi);
		double gglng = z * math.cos(theta);
		double gglat = z * math.sin(theta);
		return [gglng, gglat];
	}

	/// WGS84转GCJ02(火星坐标系)
	/// @param lng WGS84坐标系的经度
	/// @param lat WGS84坐标系的纬度
	/// @return 火星坐标数组
	static List<double> wgs84togcj02(double lng, double lat) {
		if (!isInsideChina(lat, lng)) {
			return [lng, lat];
		}
		double dlat = transformlat(lng - 105.0, lat - 35.0);
		double dlng = transformlng(lng - 105.0, lat - 35.0);
		double radlat = lat / 180.0 * pi;
		double magic = math.sin(radlat);
		magic = 1 - ee * magic * magic;
		double sqrtmagic = math.sqrt(magic);
		dlat = (dlat * 180.0) / ((a * (1 - ee)) / (magic * sqrtmagic) * pi);
		dlng = (dlng * 180.0) / (a / sqrtmagic * math.cos(radlat) * pi);
		double mglat = lat + dlat;
		double mglng = lng + dlng;
		return [mglng, mglat];
	}

	/// GCJ02(火星坐标系)转GPS84
	/// @param lng 火星坐标系的经度
	/// @param lat 火星坐标系纬度
	/// @return WGS84坐标数组
	static List<double> gcj02towgs84(double lng, double lat) {
		if (!isInsideChina(lat, lng)) {
			return [lng, lat];
		}
		double dlat = transformlat(lng - 105.0, lat - 35.0);
		double dlng = transformlng(lng - 105.0, lat - 35.0);
		double radlat = lat / 180.0 * pi;
		double magic = math.sin(radlat);
		magic = 1 - ee * magic * magic;
		double sqrtmagic = math.sqrt(magic);
		dlat = (dlat * 180.0) / ((a * (1 - ee)) / (magic * sqrtmagic) * pi);
		dlng = (dlng * 180.0) / (a / sqrtmagic * math.cos(radlat) * pi);
		double mglat = lat + dlat;
		double mglng = lng + dlng;
		return [ lng * 2 - mglng, lat * 2 - mglat];
	}

	/// 纬度转换
	/// @param lng
	/// @param lat
	/// @return
	static double transformlat(double lng, double lat) {
		double ret = -100.0 + 2.0 * lng + 3.0 * lat + 0.2 * lat * lat +
				0.1 * lng * lat + 0.2 * math.sqrt(lng.abs());
		ret += (20.0 * math.sin(6.0 * lng * pi) +
				20.0 * math.sin(2.0 * lng * pi)) * 2.0 / 3.0;
		ret += (20.0 * math.sin(lat * pi) + 40.0 * math.sin(lat / 3.0 * pi)) *
				2.0 / 3.0;
		ret += (160.0 * math.sin(lat / 12.0 * pi) +
				320 * math.sin(lat * pi / 30.0)) * 2.0 / 3.0;
		return ret;
	}

	/// 经度转换
	/// @param lng
	/// @param lat
	/// @return
	static double transformlng(double lng, double lat) {
		double ret = 300.0 + lng + 2.0 * lat + 0.1 * lng * lng +
				0.1 * lng * lat + 0.1 * math.sqrt(lng.abs());
		ret += (20.0 * math.sin(6.0 * lng * pi) +
				20.0 * math.sin(2.0 * lng * pi)) * 2.0 / 3.0;
		ret += (20.0 * math.sin(lng * pi) + 40.0 * math.sin(lng / 3.0 * pi)) *
				2.0 / 3.0;
		ret += (150.0 * math.sin(lng / 12.0 * pi) +
				300.0 * math.sin(lng / 30.0 * pi)) * 2.0 / 3.0;
		return ret;
	}

}