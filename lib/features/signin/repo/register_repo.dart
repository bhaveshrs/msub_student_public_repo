import 'dart:async';

import 'package:msub/config/network_services/api_result.dart';
import 'package:msub/config/network_services/api_result_service.dart';
import 'package:msub/features/signin/model/register_response_model.dart';
import 'package:msub/features/signin/service/register_service.dart';

class RegisterRepository {
  Future<RepoResult> sendOtpMai({required payload}) async {
    try {
      final authService = RegisterService();
      final response =
          await commonApiCall(authService.sendEmailOtp(payload: payload));

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

  Future<RepoResult> verifyOtp({required payload}) async {
    try {
      final authService = RegisterService();
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

  Future<RepoResult> register({required payload}) async {
    try {
      final authService = RegisterService();
      final response =
          await commonApiCall(authService.register(payload: payload));

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
