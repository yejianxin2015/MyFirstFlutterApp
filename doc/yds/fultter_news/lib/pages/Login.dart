import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fultter_news/pages/tabs/Setting.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  /*  final arguments;
  _LoginPageState(this.arguments);
 */
  final _username = TextEditingController(); //TextEditingController是监听输入框
  final _password = TextEditingController();
  bool _showPassword = false;

  void _passwordIcon() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  List _list = []; //获取数据
  String _msg = "";
  _getData() async {
    var apiUrl = Uri.parse('http://www.liulongbin.top:3006/api/getbooks');
    var response = await http.get(apiUrl);
    if (response.statusCode == 200) {
      print(json.decode(response.body));
      setState(() {
        _list = json.decode(response.body)["data"];
      });
    } else {
      print(response.statusCode);
    }
  }

  _showAlertDialog() {
    //当出现登录失败，则跳出提示框
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              title: Text("提示"),
              content: Text("密码/用户名错误"),
              semanticLabel: 'Label',
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("ok"))
              ],
            ));
  }

  @override
  void initState() {
    super.initState();
    _username.text = '';
    _password.text = '';
    this._getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("登录")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        /* child: TextDemo(), */
        child: Column(children: <Widget>[
          TextField(
            //用户名文本框
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
                labelText: "用户名"),
            controller: _username, //提取出文本框填写的东西
          ),
          SizedBox(height: 10),
          TextField(
            //密码文本框
            obscureText: !_showPassword, //判断是否遮挡文字
            cursorColor: Colors.red,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
                labelText: "密码",
                suffixIcon: GestureDetector(
                  onTap: () {
                    _passwordIcon();
                  },
                  child: Icon(
                    _showPassword
                        ? Icons.visibility
                        : Icons.visibility_off, //对是否遮挡文字相对应显示的图标
                    color: Colors.red,
                  ),
                )),
            controller: _password,
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 45,
            child: ElevatedButton(
              child: Text("登录"), //点击登录按钮进行登录
              onPressed: () {
                print(_username.text);
                print(_password.text);
                int num = 0;
                for (var i = 0; i < _list.length; i++) {
                  //验证是否登录成功
                  print(_list[i]["bookname"]);
                  print(_list[i]["author"]);
                  if (_list[i]["bookname"] == _username.text &&
                      _list[i]["author"] == _password.text) {
                    Navigator.pushNamed(context, '/');
                    print("成功");
                  } else {
                    num++;
                  }
                }
                if (num == _list.length) {
                  _showAlertDialog();
                  print("失败");
                }
              },
            ),
          ),
        ]),
      ),
    );
  }
}
