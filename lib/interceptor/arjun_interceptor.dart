import 'package:flutter_boilerplate/utils/sharedPrefKeys.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    print(data);
    SharedPreferences sp = await  SharedPreferences.getInstance();
    data.headers['Auth']  = sp.getString(SharedPreferencesKeys.SP_AUTH);
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    print(data);
    return data;
  }

}