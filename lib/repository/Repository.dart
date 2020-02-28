import 'dart:convert' as convert;
import 'package:flutter_boilerplate/interceptor/arjun_interceptor.dart';
import 'package:flutter_boilerplate/utils/api.dart';
import 'package:flutter_boilerplate/utils/sharedPrefKeys.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http_interceptor/http_client_with_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Repository{


   static Future<dynamic> login() async{
    var response = await http.get(Api.GET_JWT);
    print(response.body+"\n\n");
    String jsonResponse = response.body.toString();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(SharedPreferencesKeys.SP_AUTH, jsonResponse);
    return jsonResponse;
  }

  static Future<dynamic> securedResource() async{
     Client client = HttpClientWithInterceptor.build(interceptors: [
       LoginInterceptor(),
     ]);
     var response =  await client.get(Api.SECURED_RESOURCE);
     var jsonResponse = convert.jsonDecode(response.body);
     return jsonResponse;

     //ok wait

  }

}