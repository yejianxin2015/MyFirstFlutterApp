import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {

  TextEditingController _unameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  bool pwdShow = false;
  GlobalKey _formKey = GlobalKey<FormState>();
  bool _nameAutoFocus = true;

  get GmLocalizations => null;

  get Provider => null;

  @override
  void initState() {
    // 自动填充上次登录的用户名，填充后将焦点定位到密码输入框
    var Global;
    _unameController.text = Global.profile.lastLogin ?? "";
    if (_unameController.text.isNotEmpty) {
      _nameAutoFocus = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var gm = GmLocalizations.of(context);
   return Scaffold(
     appBar: AppBar(title: Text(gm.login)),
     body: Padding(
       padding: const EdgeInsets.all(16.0),
       child: Form(
         key: _formKey,
         autovalidateMode: AutovalidateMode.onUserInteraction,
         child: Column(children: <Widget>
         [TextFormField(
           autofocus: _nameAutoFocus,
           controller: _unameController,
           decoration: InputDecoration(
             labelText: gm.userName,
             hintText: gm.userName,
             prefixIcon:Icon(Icons.person),
           ),
           //校验用户名
           validator: (v){
            return v==null||v.trim().isNotEmpty ? null : gm.userNameRequired;
           },),
           TextFormField(
             controller: _pwdController,
             autofocus: !_nameAutoFocus,
             decoration: InputDecoration(
               labelText: gm.password,
               hintText: gm.password,
               prefixIcon: Icon(Icons.lock),
               suffixIcon: IconButton(
                 icon:Icon(
                   pwdShow ? Icons.visibility_off : Icons.visibility),
                  onPressed: (){
                    setState(() {
                    pwdShow = !pwdShow;
                     });
                  },
             ),),
             obscureText: !pwdShow,
             //校验密码
             validator : (v) {
                      return v==null||v.trim().isNotEmpty ? null : gm.passwordRequired;
              },
           ),
           Padding(
             padding: const EdgeInsets.only(top: 25),
             child:ConstrainedBox(
               constraints: BoxConstraints.expand(height: 55.0),
               child: ElevatedButton(
                 onPressed: _onLogin,
                 child: Text(gm.login),
                 ),
               ),
             ),
           ],
          ),
       ),
     ),
   );
}

void _onLogin() async {
  if ((_formKey.currentState as FormState).validate()){
      showLoading(context);
      User? user;
      try {
        user = await Git(context)
            .login(_unameController.text, _pwdController.text);
        // 因为登录页返回后，首页会build，所以我们传false，更新user后不触发更新
        // ignore: use_build_context_synchronously
        Provider.of<UserModel>(context, listen: false).user = user;
      } 
     finally {
        // 隐藏loading框
        Navigator.of(context).pop();
      }
      //登录成功则返回
      if (user != null) {
        Navigator.of(context).pop();
      }
    }
  }

  void showLoading(BuildContext context) {}

  Git(BuildContext context) {}

  void showToast(userNameOrPasswordWrong) {}
}

class User {
}

class UserModel {
}