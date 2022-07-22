// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import '../Tabs.dart';

import '../../res/newsData.dart';

class ListDemoPage extends StatefulWidget {
  ListDemoPage({Key? key}) : super(key: key);

  @override
  State<ListDemoPage> createState() => _ListDemoPageState();
}

class _ListDemoPageState extends State<ListDemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("列表页面"),
        centerTitle: true,
        actions: <Widget>[
          //头部设置一个图标
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/detailList'); //跳转到详细页
              },
              child: Text("管理"))
        ],
      ),
      body: ListView(
        children: choice.map((value) {
          return Card(
            //以卡片的形式显示列表
            margin: EdgeInsets.all(20),
            child: Column(children: <Widget>[
              AspectRatio(
                //大图片部分
                aspectRatio: 16 / 9,
                child: Image.network(
                  value["imgUri"],
                  fit: BoxFit.cover,
                ),
              ),
              ListTile(
                  leading: CircleAvatar(
                      //让图片形成圆形
                      backgroundImage: NetworkImage(value["imgUri"])),
                  title: Text(value["title"]),
                  subtitle: Text(
                    value["content"],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () {
                    //进入详情界面
                    Navigator.pushNamed(context, '/detail',
                        arguments: {"id": value["id"]}); //并在进入时传入参数
                  })
            ]),
          );
        }).toList(),
      ),
    );
  }
}
