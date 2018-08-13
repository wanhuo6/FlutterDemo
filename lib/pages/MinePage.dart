import 'package:flutter/material.dart';

class MinePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new MineState();
  }

}
class MineState extends State<MinePage>{
  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new Text("个人中心"),
        new Image(image: new NetworkImage("https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3831869295,1720381929&fm=27&gp=0.jpg"), fit: BoxFit.fill)
      ],
    );
  }
}