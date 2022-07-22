import 'package:flutter/material.dart';
import 'package:fultter_news/pages/Login.dart';
import '../pages/Tabs.dart';
import '../pages/Detail.dart';
import '../pages/DetailList_delete.dart';
import '../pages/Login_test.dart';

final routes = {
  '/': (context, {aguments}) => Tabs(),
  '/login': (context) => LoginPage(),
  '/detail': (context, {arguments}) => DetailPage(
        arguments: arguments,
      ),
  '/detailList': (context) => DetailListPage(),
  '/test': (context) => LoginTestPage()
};
var onGenerateRoute = (RouteSettings settings) {
  final String? name = settings.name;
  final Function pageContentBuilder = routes[name] as Function;
  if (settings.arguments != null) {
    final Route route = MaterialPageRoute(
        builder: (context) =>
            pageContentBuilder(context, arguments: settings.arguments));
    return route;
  } else {
    final Route route =
        MaterialPageRoute(builder: (context) => pageContentBuilder(context));
    return route;
  }
};
