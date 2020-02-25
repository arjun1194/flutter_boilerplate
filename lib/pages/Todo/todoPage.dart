import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class Todo extends StatefulWidget {
  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:Center(child: Text('todo'),));
  }
}
