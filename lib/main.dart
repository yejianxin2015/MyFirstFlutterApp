import 'package:demo/Index_Page.dart';
import "package:flutter/material.dart";
import 'package:demo/login_page.dart';
//import 'bottom_navigation_widget.dart';
//import 'Home_Page.dart';
//import 'cart_page.dart';

void main() => runApp(new MyApp());


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Flutter bottomNavigationBar',
      theme:ThemeData.light(),
      home:IndexPage()
    );
  }
}

