import 'dart:math';
import 'dart:core';

class Distance{

	///直角度数
	static const RIGHT_ANGLE = 90.0;
	///地球（平均）半径（千米）
	static const EARTH_RADIUS = 6371.004;

	///角度转弧度
	static double deg2Rad(double degree){
		return degree * pi / (RIGHT_ANGLE * 2);
	}

	///获取直线距离
	///srcLon 第一个点的经度
	///srcLat 第一个点的纬度
	///destLon 第二个点的经度
	///destLat 第二个点的纬度
	///return (千米)
	static double getDirectDistance(double srcLon, double srcLat, double destLon, double destLat){
		double radSrcLat = deg2Rad(srcLat);
		double radDestLat = deg2Rad(destLat);
		double a = radSrcLat - radDestLat;
		double b = deg2Rad(srcLon) - deg2Rad(destLon);

		double directDistance = 2 * asin(sqrt(pow(sin(a/2),2) +	cos(radSrcLat)*cos(radDestLat)*pow(sin(b/2),2)));

		directDistance = directDistance * EARTH_RADIUS;
		directDistance = (directDistance * 10000).round() / 10000;

		return num.parse(directDistance.toStringAsFixed(3));
	}
}