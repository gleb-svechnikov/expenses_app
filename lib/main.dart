import './transaction.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

String getAmountWithCurrency(double amount) {
  Intl.defaultLocale = 'ru_RU';
  var format = NumberFormat.simpleCurrency();
  return '${amount.toString()}  ${format.currencySymbol}';
}

var uuid = Uuid();

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
  final List<Transaction> transactions = [
    Transaction(id: uuid.v4(), title: 'Electric planer', amount: 3899.00, date: DateTime.utc(2021, 03, 19)),
    Transaction(id: uuid.v4(), title: 'Groceries', amount: 2822.18, date: DateTime.utc(2021, 03, 20)),
    Transaction(id: uuid.v4(), title: 'Meds', amount: 222.55, date: DateTime.utc(2021, 03, 21))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Expenses app'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
            Column(
              children: transactions
                  .map(
                    (transaction) => Card(
                      child: Row(
                        children: [
                          Container(
                            width: 150,
                            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                            decoration: BoxDecoration(border: Border.all(color: Colors.grey, width: 2)),
                            child: Text(
                              getAmountWithCurrency(transaction.amount),
                              style: TextStyle(color: Colors.blueGrey, fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            padding: EdgeInsets.all(10),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                transaction.title,
                                style: TextStyle(color: Colors.blue, fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                transaction.date.toString().split(' ')[0], // temp fix due to intl incompatibility
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            )
          ],
        ));
  }
}
