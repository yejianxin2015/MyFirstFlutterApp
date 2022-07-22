import 'package:flutter/material.dart';
import '../pages/Detail.dart';
import 'tabs/Home.dart';
import 'tabs/ListDemo.dart';
import 'tabs/Setting.dart';

class Tabs extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final index;
  final num;
  Tabs({Key? key, this.index = 0, this.num = 0}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<Tabs> createState() => _TabsState(index);
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  _TabsState(index) {
    _currentIndex = index;
  }
  List _pageList = [
    Homepage(),
    ListDemoPage(),
    /* DetailPage(), */
    SettingPage()
  ]; //将三个界面放入一个数组集合
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(title: const Text('Flutter Demo')), //导航栏 */
      body: _pageList[_currentIndex], //因为_currentIndex是序号（从0开始），
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          //因为点击每个按钮会返回所按的序号是哪个，所以可以得到序号来进行按钮的转换
          setState(() {
            _currentIndex = index;
          });
        },
        iconSize: 28.0, //导航按钮的大小
        fixedColor: Colors.yellow, //导航按钮的颜色
        // ignore: prefer_const_literals_to_create_immutables
        type: BottomNavigationBarType.fixed, //type是按钮的显示类型，这样写才可以让按钮超过3个
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "列表"),
          /* BottomNavigationBarItem(icon: Icon(Icons.select_all), label: "详细"), */
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "设置")
        ],
      ),
    );
  }
}
