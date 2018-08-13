import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}
class HomePageState extends State<HomePage>{

  final List<String> items=new List<String>.generate(10000, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {

    return new Container(
        child: new ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return new ListTile(
              title: new Text('${items[index]}'),
            );
          },
        ),
    );
  }
}