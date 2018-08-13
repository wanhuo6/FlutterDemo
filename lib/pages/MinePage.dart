import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MinePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new MineState();
  }

}
class MineState extends State<MinePage>{
  @override
  Widget build(BuildContext context) {
    _networkLoading();
    return new Row(
      children: <Widget>[
        new Text("个人中心"),
        new Image(image: new NetworkImage("https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3831869295,1720381929&fm=27&gp=0.jpg"), fit: BoxFit.fill)
      ],
    );
  }

  void _networkLoading() {
    // 将给定标头的HTTP GET请求发送到给定的URL，并注册回调，参数为HTTP响应
    http.get('https://domokit.github.io/examples/stocks/data/stock_data_2.json').then((http.Response response) {
      // 响应的主体作为字符串返回
      String netdata = response.body;
      // JsonDecoder类解析JSON字符串并构建相应的对象
      print('======'+netdata);
    /*  JsonDecoder decoder = new JsonDecoder();
      // 将给定的JSON字符串输入转换为其对应的对象
      List<List<String>> json = decoder.convert(netdata);
      // 输出给定的JSON数据
      print(json[0][1]);*/
    });
  }
}