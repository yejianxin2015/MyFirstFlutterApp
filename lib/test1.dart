import 'dart:core';


//hello world示例
//void main(){
//   print('hello world!');
// }


//显示指定变量示例
// void main(){
//   String name = "哈哈";
//   int age = 31;
//   print('$name''====$age');
// }

//动态语言的常用变量声明方式，不指定类型
// void main(){
//   String name = "哈哈";
//   name = '粥~';
//   print('$name');//当同时出现显示定义和隐式定
//输出最后声明的变量
// }

//显示声明和隐式声明同样的数据大小，不同的类型会报错
// void main(){
//   /*int*/num age = 10;
//   age = 10.0; //直接就报错，将int换成num就可以解决
//因为int和double都是num的子类。
//   print('$age');
// }

//var:当声明变量且赋值的时候，就已经决定了它的类型
//后面不可以再赋其他类型的值
// void main(){
//   var age = 18;//var已经将age定义为num类型并且赋值了
//   age = '18';//此处定义age为字符串类型就会报错
//   print('$age');
// }

//  void main() {
//   var age;//此时age已经确定为num类型但是没有赋值，
//   age = 18;
//   age = '18';//所以在继续赋值字符串是可以的
//   print('$age');
// }

// //所有类都继承自Object类
// void main(){
//   Object age = '18';
//   age = 18;
//   print('$age');//输出最后声明的对象
// }

//dynamic类,声明变量的行为和Object一样
//使用也一样，但是dynamic是在运行的时候才确定类型的
// void main(){
//   dynamic name = '哈哈';
//   print(name.runtimeType);
//   name = 31;
//   print(name.runtimeType);
// }

//一等方法函数
// void main(){
//   var list = ["yi","er","san"];

//   void printElement(element){
//     print(element);
//   }

//   list.forEach(printElement);

  // int add({int i,int j}){
  //   if( i==null || j==null ){
  //     return 0;
  //   } 
  //   return i+j;
  //   }

  //   print("-1-${add(i:10,j:20)}");
  //   print("-2-${add(j:10)}");
  //   print("-3-${add()}");
  //   print("-4-${add(j:10,i:20)}");
// void main() {
//   int add({ i, j}) {
//     if (i == null || j == null) {
//       return 0;
//     }
//     return i + j;
//   }

//   //全参调用
//   print("--1--${add(i: 10, j: 20)}"); //输出：30
//   //不传参数（调用也是正确的）
//   print("--2--${add()}"); //输出：0
//   //选择传递参数
//   print("--3--${add(j: 20)}"); //输出：0
//   //与位置无关
//   print("--4--${add(j: 20, i: 10)}"); //输出：30
// }

//可选位置参数
// void main(){
//   int add([i,j]){
//     if(i==null || j==null){
//       return 0;
//     }
//     return i+j;
//   }
//   //全参调用
//   print("--1--${add(10,  20)}"); //输出：30
//   //不传参数（调用也是正确的）
//   print("--2--${add()}"); //输出：0
//   //与位置无关
//   print("--4--${add(20)}"); //输出：30
// }

// //类
// class User{
//   var name;
//   var age;

//   User(this.name,this.age);//默认构造函数
// }

// void main() {
//   var user = User("哈哈",31);

//   var _name = user.name;
//   var _age = user.age;

//   print("---$_name$_age");
// }

// //工厂构造函数
// class Logger {
//   final String name;
//   bool mute = false;

//   static final Map<String, Logger> _cache = <String, Logger>{};

//   factory Logger(String name) {
//     if (_cache.containsKey(name)) {
//       return _cache[name];
//     } else {
//       final logger = new Logger._internal(name);
//       _cache[name] = logger;
//       return logger;
//     }
//   }

//   Logger._internal(this.name);

//   void log(String msg) {
//     if (!mute) {
//       print(msg);
//     }
//   }
// }

// //调用
// void main() {
//   //工厂
//   var logger = new Logger('UI');
//   logger.log('Button clicked');
// }

//接口，class声明的类就可以是接口。也可以使用implements
class User{
  //_name变量同样在接口里面，但他只是库内可见
  final _name;

//构造函数不在接口中
  User(this._name);

//greet()方法在接口中
  String greet(String who)=>'你好,$who.我是$_name.';
}

//Person接口实现
class Impostor implements User{
  get _name => '';

  String greet(String who) => '你好$who.你知道我是谁吗？';
}

String greetBob(User person) => person.greet('哈哈');

void main(){
  print(greetBob(User('哈哈1')));
  print(greetBob(Impostor()));
}  
