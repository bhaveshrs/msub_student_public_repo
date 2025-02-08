import 'package:msub/config/network_services/api_client.dart';
import 'package:msub/config/network_services/api_result.dart';
import 'package:msub/config/resource/apis_end_points.dart';

class ForgotPassService {
  Future<ApiResult> sendForgotPassOtp({payload}) async {
    ApiResult apiResult = await DioClient().post(
      ApisEndPoints.forgetPasswordOtp,
      data: payload,
    );
    return apiResult;
  }

  Future<ApiResult> verifyOtp({payload}) async {
    ApiResult apiResult = await DioClient().post(
      ApisEndPoints.verifyForgetPasswordOtp,
      data: payload,
    );
    return apiResult;
  }

  Future<ApiResult> resetPass({payload}) async {
    ApiResult apiResult = await DioClient().post(
      ApisEndPoints.resetPass,
      data: payload,
    );
    return apiResult;
  }
}
