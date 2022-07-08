import 'package:flutter/material.dart';

class BottomNavigationWidget extends StatefulWidget {

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  final _BottomNavigationColor = Colors.blue;


  @override
  Widget build(BuildContext context) {
    
    
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _BottomNavigationColor,
            ),
            label:"主页",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
              color: _BottomNavigationColor,
            ),
             label: "购物车",//一开始先使用了title来设置文职，但是发现title写了有错误，错误的介绍时没有定义，因为flutter的升级，item里面的属性就没有title了，于是我就把title改成了label，然后就可以了
           //stlye:TextStyle(color: _BottomNavigationColor)
          ),
        ]
      ),
    );
  }
}