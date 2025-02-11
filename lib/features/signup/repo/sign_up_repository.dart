import 'dart:async';

import 'package:msub/config/network_services/api_result.dart';
import 'package:msub/config/network_services/api_result_service.dart';
import 'package:msub/features/signup/models/get_user_model.dart';
// import 'package:msub/features/signup/model/signup_response_model.dart';
import 'package:msub/features/signup/service/sign_up_service.dart';

class SignUpRepository {
  final SignUpService _signUpService = SignUpService();

  Future<RepoResult> checkUserExists({required String prn}) async {
    try {
      final response = await commonApiCall(
          _signUpService.checkUserExists(payload: {"prn_employee_id": prn}));

      if (response is ApiSuccess) {
        GetUserModel userData = GetUserModel.fromMap(response.data);
        return RepoSuccess(message: response.message, data: userData);
      } else {
        return RepoFailure(error: (response as ApiFailure).errorMsg);
      }
    } catch (_) {
      return RepoFailure(error: _.toString());
    }
  }

  Future<RepoResult> updateUserName(
      {required String prn, required String name}) async {
    try {
      final response = await commonApiCall(_signUpService
          .updateUserName(payload: {"prn_employee_id": prn, "name": name}));
      if (response is ApiSuccess) {
        return RepoSuccess(message: response.message);
      } else {
        return RepoFailure(error: (response as ApiFailure).errorMsg);
      }
    } catch (_) {
      return RepoFailure(error: _.toString());
    }
  }
}
