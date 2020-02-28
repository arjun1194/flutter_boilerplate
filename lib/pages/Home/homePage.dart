import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/repository/Repository.dart';
import 'package:flutter_boilerplate/utils/sharedPrefKeys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  String jwt;

  @override
  initState(){
    super.initState();
    jwt = '';
  }

  getJwtFromSP(){
    SharedPreferences.getInstance().then((sp){
      setState(() {
        jwt = sp.getString(SharedPreferencesKeys.SP_AUTH);
        print(jwt);
      });
    });
  }

  saveAuth() {


    Repository().login().then((jsonVal) {
      print(jsonVal.toString());
      print('data recievedd');
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Todo App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('GET JWT from API'),
                onPressed: () {
                  saveAuth();
                },
              ),
              Text(jwt),
              RaisedButton(
                child: Text('GET JWT from SP'),
                onPressed: () {
                  getJwtFromSP();
                },
              )
            ],
          ),
        ));
  }
}


