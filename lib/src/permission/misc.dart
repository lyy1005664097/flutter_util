import 'package:permission_handler/permission_handler.dart';

export 'package:permission_handler/permission_handler.dart';

typedef RequestFailedCallBack = Function();

///请求权限的方法
///@param groups 需要申请的权限列表
///@param onFailed 获取权限失败时调用的方法
Future<bool> requestPermission(List<PermissionGroup> groups, {RequestFailedCallBack onFailed}) async {
  final permissions = await PermissionHandler().requestPermissions(groups);

  for(PermissionGroup group in groups){
    if(permissions[group] != PermissionStatus.granted){
      if(onFailed == null){
        bool result =  await PermissionHandler().openAppSettings();
        return result;
      }else{
        onFailed();
        return false;
      }
    }
  }
  return true;
}