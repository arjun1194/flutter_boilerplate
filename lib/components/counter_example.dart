//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_boilerplate/mobx/sample_counter.dart';
//import 'package:flutter_mobx/flutter_mobx.dart';
//
//class CounterExample extends StatefulWidget {
//  const CounterExample({Key key}) : super(key: key);
//
//  @override
//  _CounterExampleState createState() => _CounterExampleState();
//}
//
//class _CounterExampleState extends State<CounterExample> {
//  final _counter = Counter();
//
//  @override
//  Widget build(BuildContext context) => Scaffold(
//    appBar: AppBar(
//      title: const Text('Counter'),
//    ),
//    body: Center(
//      child: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: <Widget>[
//          const Text(
//            'You have pushed the button this many times:',
//          ),
//          Observer(
//              name: "counter",
//              builder: (_) => Text(
//                '${_counter.value}',
//                style: const TextStyle(fontSize: 20),
//              )),
//        ],
//      ),
//    ),
//    floatingActionButton: FloatingActionButton(
//      onPressed: _counter.increment,
//      tooltip: 'Increment',
//      child: const Icon(Icons.add),
//    ),
//
//  );
//}