import 'dart:async';


import 'package:msub/config/network_services/api_result.dart';
import 'package:msub/config/network_services/api_result_service.dart';
import 'package:msub/features/forgot_pass/service/forgotpass_service.dart';
import 'package:msub/features/signin/model/register_response_model.dart';

class ForgotPassRepository {
  Future<RepoResult> sendForgotPassOtp({required payload}) async {
    try {
      final authService = ForgotPassService();
      final response =
          await commonApiCall(authService.sendForgotPassOtp(payload: payload));

      if (response is ApiSuccess) {
        return RepoSuccess(
          message: response.message,
        );
      } else {
        return RepoFailure(
            error: (response as ApiFailure).errorMsg, data: (response).errors);
      }
    } catch (_, s) {
      print(_);
      print(s);
      return RepoFailure(error: _.toString());
    }
  }

  Future<RepoResult> verifyOtp({required payload}) async {
    try {
      final authService = ForgotPassService();
      final response =
          await commonApiCall(authService.verifyOtp(payload: payload));
      if (response is ApiSuccess) {
        return RepoSuccess(
          message: response.message,
        );
      } else {
        return RepoFailure(
            error: (response as ApiFailure).errorMsg, data: (response).errors);
      }
    } catch (_) {
      return RepoFailure(error: _.toString());
    }
  }

  Future<RepoResult> resetPass({required payload}) async {
    try {
      final forgotPassService = ForgotPassService();
      final response =
          await commonApiCall(forgotPassService.resetPass(payload: payload));

      if (response is ApiSuccess) {
        return RepoResult.success(
            data: RegisterResponseModel.fromMap(response.data),
            message: response.message);
      } else {
        return RepoFailure(
            error: (response as ApiFailure).errorMsg, data: (response).errors);
      }
    } catch (_, s) {
      print(_);
      print(s);
      return RepoFailure(error: _.toString());
    }
  }
}
