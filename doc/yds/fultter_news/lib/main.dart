import 'dart:ui';

import 'package:flutter/material.dart';
import 'pages/Tabs.dart';
import 'routes/Routes.dart';

void main() {
  runApp(MyApp());
}

//自定义组件
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //StatelessWidget无状态组件

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //去掉debug的图标
      /*  home: Tabs(), */
      initialRoute: '/', //表示初始化要加载的路由（即首界面）
      onGenerateRoute: onGenerateRoute,
      /* theme: ThemeData(primarySwatch: Colors.yellow), */ //主题颜色
    );
  }
}
