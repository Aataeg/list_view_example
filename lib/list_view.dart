import 'package:flutter/material.dart';
import 'dart:math';

import 'item_view.dart';

var pointIconIndex;
var text = '';

class ListViewExample extends StatefulWidget {
  const ListViewExample({Key? key}) : super(key: key);

  @override
  _ListViewExampleState createState() => _ListViewExampleState();
}

class _ListViewExampleState extends State<ListViewExample> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
      routes: {
        '/itemview': (context) => ItemView(pointIconIndex: pointIconIndex, text: text,),
      },
    );
  }

}


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<int> pointIcon = List.generate(20, (index) => Random().nextInt(1000));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: ListView.builder(
              itemCount: 20,
              itemBuilder: _itemBuilder),
        )
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
//    pointIcon = Random().nextInt(1000);
    int _selectedIndex = 0;

    return Card(
      child: ListTile(
        leading: Icon(IconData(pointIcon[index])),
        title: _makeText(index),
        selected: index == _selectedIndex,
        onTap: (){
          setState(() {
            _selectedIndex = index;
            pointIconIndex = pointIcon[index];
            text = 'Элемент списка $_selectedIndex';
            Navigator.pushNamed(context, '/itemview'); },);
          },
      )
    );
  }
}

_makeText(int index) {
  text = 'Элемент списка $index';
  return Text(text);
}

