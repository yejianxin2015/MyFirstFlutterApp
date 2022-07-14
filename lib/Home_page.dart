import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      leading: Icon(Icons.back_hand),
      title: Text("产品细节"),
      ),
      
      body:ListView(children:<Widget>[
       Column(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(children: <Widget>[
              Text("Title",
              textScaleFactor: 2.5,),
            ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
              Icon(Icons.settings_applications,size: 80.0,),
              Column(children: <Widget>[
                Text("这是一行文字",
                textScaleFactor: 1,),
              Text("2022-07-14"),
              ],
              ),
              Icon(Icons.add),
            ],
            ),
          ],
       ),
       Image(
         image:NetworkImage(
         "https://unsplash.com/photos/y-VhDt6KsKg",
         scale: 5.0
         ),
        ),
      Text("7月14日,完美世界发布2022年半年度业绩预告。今年1～6月预计实现归母净利润11.1～11.6亿元,比上年同期增长331%～350%;扣除非经常性损益后的净利润为6.4～6.8亿元,同比大增1574%～1678%。其中,游戏业务实现净利润11.6～12亿元,同比增长420%～438%,游戏业务扣非后净利润约为7.2～7.6亿元,同比大增1892%～2003%。",
      textScaleFactor: 1.0,)
      ]
      )
    );
  }
}