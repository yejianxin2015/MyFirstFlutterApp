import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../res/goods.dart';

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var textController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("首页")),
      body: ListView(
        children: goods.map((v) {
          return Container(
            child: Column(children: <Widget>[
              CheckboxListTile(
                //CheckBox
                value: v["checked"],
                onChanged: (value) {
                  setState(() {
                    v!["checked"] = value;
                  });
                },
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(v["title"]), //每个CheckBox的物品名称
                ),
                subtitle: Row(children: <Widget>[
                  Container(
                    height: 30.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4), //设置加减数量的外框
                        border: Border.all(width: 1, color: Colors.black12)),
                    child:
                        Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                      GestureDetector(
                        //减数量
                        onTap: () {
                          if (v["num"] == 0) {
                            return;
                          }
                          setState(() {
                            v["num"]--;
                          });
                        },
                        child: Container(
                          //减数量的图像设置
                          width: 32.0,
                          alignment: Alignment.center,
                          child: const Icon(Icons.remove),
                        ),
                      ),
                      Container(
                        //加减数量框中的数字的位置
                        width: 40.0,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            border: Border(
                                //两条隔离线设置
                                left:
                                    BorderSide(width: 1, color: Colors.black12),
                                right: BorderSide(
                                    width: 1, color: Colors.black12))),
                        child: Text(
                          //显示数字
                          v["num"].toString(),
                          maxLines: 1,
                          style: const TextStyle(
                              fontSize: 14, color: Colors.black),
                        ),
                      ),
                      GestureDetector(
                        //加数量
                        onTap: () {
                          setState(() {
                            v["num"]++;
                          });
                        },
                        child: Container(
                          width: 32.0,
                          alignment: Alignment.center,
                          child: const Icon(Icons.add),
                        ),
                      )
                    ]),
                  ),
                ]),
                secondary: Image.network(
                  //每个CheckBox对应的图像
                  v["imgUri"],
                  fit: BoxFit.cover,
                ),
                selected: v["checked"] == true, //实现点击后高亮
              ),
              const SizedBox(height: 10),
            ]),
          );
        }).toList(),
      ),
    );
  }
}
