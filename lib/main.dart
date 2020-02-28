import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/routes/routes.dart';
import 'package:flutter_stetho/flutter_stetho.dart';
void main() {
  Stetho.initialize();
  runApp(MaterialApp(routes: routes,));

}





