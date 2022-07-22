class Test_model {
  final int status;
  final String message;
  final List<Datas> data;
  Test_model({required this.status, required this.message, required this.data});

  factory Test_model.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['data'] as List;
    print(list.runtimeType);
    List<Datas> dataList = list.map((i) => Datas.fromJson(i)).toList();

    return Test_model(
        status: parsedJson['status'],
        message: parsedJson['message'],
        data: dataList);
  }
}

class Datas {
  final String username;
  final String password;
  Datas({required this.username, required this.password});

  factory Datas.fromJson(Map<String, dynamic> parsedJson) {
    return Datas(
        username: parsedJson['username'], password: parsedJson['password']);
  }
}
