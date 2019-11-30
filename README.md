# flutter_util

自己开发时封装的一些东西整理出来，留着以后再用。

位置服务：
    - 坐标转换
    - 测两点间直线距离
    - 判断坐标点是否在中国
    
日志打印：debug模式下打印日志，release模式不打印日志。以后会新功能，把日志输出到文件。

权限管理：对permission_handler插件进行了包装。

自定义widget：
    - MyFutureBuilder 对FutureBuilder的封装，通过异步获取数据的状态显示不同的组件
    - MyOutlineButton 自定义的outlinebutton
    - Separator 可以添加一条虚线，一行图标，或一行图片
    - MyTabBar 对TabBar的封装，可以设置TabBar的背景色
