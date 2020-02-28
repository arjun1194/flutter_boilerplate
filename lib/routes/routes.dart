import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/counter_example.dart';
import 'package:flutter_boilerplate/pages/Home/homePage.dart';
import 'package:flutter_boilerplate/pages/Todo/todoPage.dart';

Map<String, WidgetBuilder> routes = {
//  '/': (BuildContext context) => CounterExample(),
  '/home':(BuildContext context) => Todo(),
};
