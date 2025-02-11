import 'package:msub/config/network_services/api_client.dart';
import 'package:msub/config/network_services/api_result.dart';
import 'package:msub/config/resource/apis_end_points.dart';

class SignUpVerifyService {
  Future<ApiResult> sendEmailOtp(
      {required Map<String, dynamic> payload}) async {
    return await DioClient().post(ApisEndPoints.sendEmailOtp, data: payload);
  }

  Future<ApiResult> verifyEmailOtp(
      {required Map<String, dynamic> payload}) async {
    return await DioClient().post(ApisEndPoints.verifyEmailOtp, data: payload);
  }

  Future<ApiResult> sendMobileOtp(
      {required Map<String, dynamic> payload}) async {
    return await DioClient().post(ApisEndPoints.sendMobileOtp, data: payload);
  }

  Future<ApiResult> verifyMobileOtp(
      {required Map<String, dynamic> payload}) async {
    return await DioClient().post(ApisEndPoints.verifyMobileOtp, data: payload);
  }

  Future<ApiResult> createPassword(
      {required Map<String, dynamic> payload}) async {
    return await DioClient().post(ApisEndPoints.setPassword, data: payload);
  }
}
