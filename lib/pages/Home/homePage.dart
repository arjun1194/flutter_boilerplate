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
  initState() {
    super.initState();
    jwt = '';
  }

  getJwtFromSP() {
    SharedPreferences.getInstance().then((sp) {
      setState(() {
        jwt = sp.getString(SharedPreferencesKeys.SP_AUTH);
        if (jwt == null) jwt = "Nothing found!";
      });
    }).catchError((err) {
      setState(() {
        jwt = err.toString();
      });
      return err;
    });
  }

  securedApi() {
    Repository.securedResource().then((val) {
      setState(() {
        jwt = val.toString();
        if (jwt == null) jwt = "Nothing found!";
      });
    }).catchError((err) {
      setState(() {
        jwt = err.toString();
      });
      return err;
    });
  }

  saveAuth() {
    Repository.login().then((jsonVal) {
      print(jsonVal.toString());
      print('data recievedd');
      setState(() {
        jwt = "Got the value from server!";
      });
    }).catchError((err) {
      setState(() {
        jwt = err.toString();
      });
      return err;
    });
  }

  deleteSP() {
    SharedPreferences.getInstance().then((sp) {
      setState(() {
        sp.remove(SharedPreferencesKeys.SP_AUTH);
        jwt = "Deleted! Shared Preferences";
      });
    }).catchError((err) {
      setState(() {
        jwt = err.toString();
      });
      return err;
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
              Text(jwt),
              RaisedButton(
                child: Text('GET JWT from API'),
                onPressed: () {
                  saveAuth();
                },
              ),
              RaisedButton(
                child: Text('GET JWT from SP'),
                onPressed: () {
                  getJwtFromSP();
                },
              ),
              RaisedButton(
                child: Text('Fetch API with interceptor'),
                onPressed: () {
                  securedApi();
                },
              ),
              RaisedButton(
                child: Text('Delete Shared Preferences'),
                onPressed: () {
                  deleteSP();
                },
              ),
            ],
          ),
        ));
  }
}
