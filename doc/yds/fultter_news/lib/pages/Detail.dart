import 'package:flutter/material.dart';
import '../res/newsData.dart';

class DetailPage extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  DetailPage({this.arguments});
  // ignore: prefer_typing_uninitialized_variables
  final arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("详情页面"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            //滚动组件
            child: Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 5.0),
                Text(
                  choice[arguments["id"]]["title"], //大标题部分
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                /* SizedBox(height: 10.0), */
                Divider(),
                ListTile(
                  leading: CircleAvatar(
                      //生成圆形头像
                      backgroundImage:
                          NetworkImage(choice[arguments["id"]]["imgUri"])),
                  title: Text(choice[arguments["id"]]["author"]), //文章作者部分
                  subtitle: Text(choice[arguments["id"]]["time"]),
                  trailing: TextButton(
                    onPressed: () {},
                    child: Text("关注"),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Image.network(choice[arguments["id"]]["imgUri"], //正文图片
                        fit: BoxFit.cover),
                    SizedBox(height: 20),
                    Text(
                      choice[arguments["id"]]["content"], //正文文字
                      style: TextStyle(height: 2),
                    )
                  ],
                ),
              ],
            ),
          ),
        )));
  }
}
