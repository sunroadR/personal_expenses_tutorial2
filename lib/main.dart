import 'package:flutter/material.dart';

import './transaction.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1',
        title: 'New Shoes',
        amount: 69.99,
        date: DateTime.now()
    ),
    Transaction(
        id: 't2',
        title: 'Weekly Groceries',
        amount: 16.53,
        date: DateTime.now()
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text('CHART!'),
              elevation: 5,
            ),
          ),
          Card(
            elevation: 5,

            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    labelText: ('Title')
                  ),

                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: ('Amount')
                  ),
                ),
                FlatButton(
                  child: Text('Add Transaction'),
                  textColor: Colors.purple,
                  onPressed: (){},

                )
              ],
          ),
            ),),

          Column(
            children: transactions.map((tx) {
              return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.purple,
                            width: 1,

                          )
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '\$${tx.amount}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple
                          ),
                        ),

                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: <Widget>[


                          Text(tx.title,
                          style: TextStyle(
                              fontSize: 16,
                               fontWeight: FontWeight.bold),
                               ),
                           Text(
                                DateFormat('dd/MM/yyyy').format(tx.date),
                          style: TextStyle(fontSize: 18,
                          color: Colors.black),),
                        ],
                      )
                    ],
                  ));
            }).toList(),),


        ],
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}
