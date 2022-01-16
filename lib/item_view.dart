import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'list_view.dart';

class ItemView extends StatelessWidget {
  var pointIconIndex;
  var text;

  ItemView({Key? key, @required this.pointIconIndex, @required this.text }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: Icon(IconData(pointIconIndex)),
            ),
            SizedBox(
              height: 100,
              child: Text(text),
            ),
            SizedBox(
              child: ElevatedButton(
                child: Text('Назад'),
                onPressed: () {Navigator.pop(context);},
              ),
            )
          ],
        ),
      ),
    );
  }
}
