import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_flutter/pages/HomePage.dart';
import 'package:hello_flutter/pages/MinePage.dart';

void main() => runApp(new MyHomePage());


class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => new MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final tabTextStyleNormal = new TextStyle(color: const Color(0xff515151));
  final tabTextStyleSelected = new TextStyle(color: const Color(0xff1296db));
  int tabIndex=0;
  var tabImages;
  var appBarTitles;
  Image getTabImage(path) {
    return new Image.asset(path, width: 20.0, height: 20.0);
  }
  Image getTabIcon(int curIndex) {
    if (curIndex == tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }
  void initData() {
    if(appBarTitles==null){
      appBarTitles = ['主页', '我的'];
    }
    if(tabImages==null){
      tabImages =
      [
        [getTabImage('images/ic_home_page_normal.png'), getTabImage('images/ic_home_page_select.png')],
        [getTabImage('images/ic_mine_normal.png'), getTabImage('images/ic_mine_select.png')],
      ];
    }
  }
    TextStyle getTabTextStyle(int curIndex) {
      if (curIndex == tabIndex) {
        return tabTextStyleSelected;
      }
      return tabTextStyleNormal;
    }
    Text getTabTitle(int curIndex) {
      return new Text(appBarTitles[curIndex], style: getTabTextStyle(curIndex));
    }
  @override
  Widget build(BuildContext context) {
    initData();
    return new MaterialApp(
      theme: new ThemeData(
          primaryColor: const Color(0xFF63CA6C)
      ),
      home: new Scaffold(
        appBar: new AppBar(
            title: new Text(appBarTitles[tabIndex],
                style: new TextStyle(color: Colors.white)),
            iconTheme: new IconThemeData(color: Colors.white)
        ),
        body: new IndexedStack(
          children: <Widget>[
            new HomePage(),
            new MinePage()
          ],
          index: tabIndex,
        ),
        bottomNavigationBar: new CupertinoTabBar(
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(
                icon: getTabIcon(0),
                title: getTabTitle(0)),
            new BottomNavigationBarItem(
                icon: getTabIcon(1),
                title: getTabTitle(1)),
          ],
          currentIndex: tabIndex,
          onTap: (index) {
            setState(() {
              tabIndex = index;
            });
          },
        ),
      ),
    );
  }


}
