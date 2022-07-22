import 'package:flutter/material.dart';

import '../../res/newsData.dart';

class DetailListPage extends StatefulWidget {
  DetailListPage({Key? key}) : super(key: key);

  @override
  State<DetailListPage> createState() => _DetailListPageState();
}

class _DetailListPageState extends State<DetailListPage> {
  var num;
  var status;

  List<Widget> _getNews() {
    List<Widget> tempList = [];
    for (var i = 0; i < choice.length; i++) {
      tempList.add(Column(
        children: <Widget>[
          CheckboxListTile(
            value: choice[i]["checked"],
            onChanged: (value) {
              setState(() {
                //改变选中状态
                choice[i]["checked"] = value;
                num = i;
                status = value;
              });
              choice[num]["status"] = status;
              print("num=${num},${status}");
            },
            title: Text(choice[i]["title"]), //大标题部分
            subtitle: Text(
              //小标题部分
              choice[i]["content"],
              maxLines: 2,
              overflow: TextOverflow.ellipsis, //让文字内容只显示两行，其余的后面为省略号
            ),
            secondary: Image.network(choice[i]["imgUri"]),
            selected: choice[i]["checked"] == true,
          ),
          Divider(),
        ],
      ));
    }
    return tempList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("列表管理"),
        centerTitle: true,
        actions: <Widget>[
          ElevatedButton(
              onPressed: () {
                _getNews();
              },
              child: Text("删除"))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: _getNews()),
      ),
    );
  }
}
