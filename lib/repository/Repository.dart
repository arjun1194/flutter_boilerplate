import 'dart:convert' as convert;
import 'package:flutter_boilerplate/interceptor/arjun_interceptor.dart';
import 'package:flutter_boilerplate/utils/api.dart';
import 'package:flutter_boilerplate/utils/sharedPrefKeys.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http_interceptor/http_client_with_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Repository{


   Future<dynamic> login() async{
     print(Api.GET_JWT);
    var response = await http.get(Api.GET_JWT);
    print(response.toString());
    var jsonResponse = convert.jsonDecode(response.body);
    print(jsonResponse.toString());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(SharedPreferencesKeys.SP_AUTH, jsonResponse);
    return jsonResponse;
  }

  Future<dynamic> securedResource() async{
     print('some secured resource');
     Client client = HttpClientWithInterceptor.build(interceptors: [
       LoginInterceptor(),
     ]);
     client.get(Api.SECURED_RESOURCE);

  }

}