import 'package:flutter/material.dart';
import 'package:fultter_news/pages/tabs/Setting.dart';
import 'package:http/http.dart' as http;
import '../res/users.dart';

class LoginTestPage extends StatefulWidget {
  LoginTestPage({Key? key}) : super(key: key);

  @override
  State<LoginTestPage> createState() => _LoginTestPageState();
}

class _LoginTestPageState extends State<LoginTestPage> {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("登录test")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        /* child: TextDemo(), */
        child: Column(children: <Widget>[
          TextField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
                labelText: "用户名"),
            controller: _username,
          ),
          SizedBox(height: 10),
          TextField(
            //密码文本框
            obscureText: !_showPassword, //遮挡文字
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
                    _showPassword ? Icons.visibility : Icons.visibility_off,
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
              child: Text("登录"),
              onPressed: () {
                print(_username.text);
                print(_password.text);
                int num = 0;
                for (var i = 0; i < Users.length; i++) {
                  print(Users[i]["name"]);
                  print(Users[i]["password"]);
                  if (Users[i]["name"] == _username.text &&
                      Users[i]["password"] == _password.text) {
                    Navigator.pushNamed(context, '/');
                    print("成功");
                  } else {
                    num++;
                  }
                }
                if (num == Users.length) {
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
