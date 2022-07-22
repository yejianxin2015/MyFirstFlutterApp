import 'package:flutter/material.dart';
import 'package:fultter_news/pages/Login.dart';

class SettingPage extends StatefulWidget {
  SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("设置")),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text("我是设置"),
          ),
          ElevatedButton(
              onPressed: () {
                /* Navigator.pushNamed(context, '/login'); */
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (context) => LoginPage())); //跳转到登录页(http)
              },
              child: Text("跳转到登录页面")),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/test');
              },
              child: Text("跳转到登录test页面")) //跳转到登录test页(无http)
        ],
      ),
    );
  }
}
