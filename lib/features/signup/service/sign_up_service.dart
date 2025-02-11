import 'package:msub/config/network_services/api_client.dart';
import 'package:msub/config/network_services/api_result.dart';
import 'package:msub/config/resource/apis_end_points.dart';

class SignUpService {
  Future<ApiResult> checkUserExists(
      {required Map<String, dynamic> payload}) async {
    return await DioClient().post(ApisEndPoints.getUser, data: payload);
  }

  Future<ApiResult> updateUserName(
      {required Map<String, dynamic> payload}) async {
    return await DioClient().post(ApisEndPoints.updateUserName, data: payload);
  }
}
