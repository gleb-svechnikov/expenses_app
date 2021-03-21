import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData.dark(),
      home: ExpenseApp(),
    );
  }
}

class ExpenseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Expenses app'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                width: double.infinity,
                child: Card(
                    color: Colors.amber,
                    child: Text(
                      'CHART',
                      style: TextStyle(color: Colors.black),
                    ))),
            Card(
              child: Text('LIST'),
              elevation: 5,
            )
          ],
        ));
  }
}
