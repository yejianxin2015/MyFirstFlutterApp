import 'package:flutter/material.dart';
import 'Home_Page.dart';
import 'cart_page.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

  
  final List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Color.fromARGB(255, 109, 194, 112),
            ),
            label:"主页",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
              color:  Color.fromARGB(255, 109, 194, 112),
            ),
             label: "购物车",//一开始先使用了title来设置文职，但是发现title写了有错误，错误的介绍时没有定义，因为flutter的升级，item里面的属性就没有title了，于是我就把title改成了label，然后就可以了
           //stlye:TextStyle(color: _BottomNavigationColor)
          ),
  ];

  int currentIndex = 0;

  final pages = [HomePage(),CartPage()];

  @override
  void initState(){
    super.initState();
    currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("一个Demo"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavItems,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.shifting,
        onTap: (index){
          _changePage(index);
        },
      ),
      body: pages[currentIndex],
    );
  }

  void _changePage(int index){
    if(index != currentIndex){
      setState(() {
              currentIndex = index;
            });
    }
  }
}
