import 'package:msub/config/resource/storage_service.dart';
class ApiHeaders {
  static Future<Map<String, dynamic>> getHeaders({String? tempToken}) async {
    String? token;
    // token = await AuthBloc().getToken();
    token = await StorageService().getSessionToken();
    if (token == '') {
      token = tempToken ?? '';
    }

    Map<String, dynamic> headers = {
      'Content-Type': 'application/json',
      'access_token': token,
    };

    return headers;
  }
}
