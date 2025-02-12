import 'package:msub/config/network_services/api_result.dart';
import 'package:msub/config/network_services/api_result_service.dart';
import 'package:msub/features/signup_verify/models/set_user_response.dart';
import 'package:msub/features/signup_verify/service/sign_up_verify_service.dart';

class SignUpVerifyRepository {
  final SignUpVerifyService _service = SignUpVerifyService();

  Future<RepoResult> sendEmailOtp(
      {required String prn, required String email}) async {
    try {
      final response = await commonApiCall(_service.sendEmailOtp(
          payload: {"role_id": "1", "prn_employee_id": prn, "email": email}));

      if (response is ApiSuccess) {
        return RepoSuccess(message: response.message);
      } else {
        return RepoFailure(error: (response as ApiFailure).errorMsg);
      }
    } catch (_) {
      return RepoFailure(error: _.toString());
    }
  }

  Future<RepoResult> verifyEmailOtp(
      {required String prn, required String email, required String otp}) async {
    try {
      final response = await commonApiCall(_service.verifyEmailOtp(
          payload: {"prn_employee_id": prn, "email": email, "otp": otp}));

      if (response is ApiSuccess) {
        return RepoSuccess(message: response.message);
      } else {
        return RepoFailure(error: (response as ApiFailure).errorMsg);
      }
    } catch (_) {
      return RepoFailure(error: _.toString());
    }
  }

  Future<RepoResult> sendMobileOtp(
      {required String prn, required String mobile}) async {
    try {
      final response = await commonApiCall(_service.sendMobileOtp(payload: {
        "country_mobile_code": "+91",
        "mobile": mobile,
        "prn_employee_id": prn
      }));

      if (response is ApiSuccess) {
        return RepoSuccess(message: response.message);
      } else {
        return RepoFailure(error: (response as ApiFailure).errorMsg);
      }
    } catch (_) {
      return RepoFailure(error: _.toString());
    }
  }

  Future<RepoResult> verifyMobileOtp(
      {required String prn,
      required String mobile,
      required String otp}) async {
    try {
      final response = await commonApiCall(_service.verifyMobileOtp(payload: {
        "prn_employee_id": prn,
        "mobile": mobile,
        "country_mobile_code": "+91",
        "otp": otp
      }));

      if (response is ApiSuccess) {
        return RepoSuccess(message: response.message);
      } else {
        return RepoFailure(error: (response as ApiFailure).errorMsg);
      }
    } catch (_) {
      return RepoFailure(error: _.toString());
    }
  }

  Future<RepoResult> createPassword(
      {required String prn,
      required String email,
      required String password}) async {
    try {
      final response = await commonApiCall(_service.createPassword(payload: {
        "prn_employee_id": prn,
        "email": email,
        "password": password,
        "device_id": "qwe"
      }));

      if (response is ApiSuccess) {
        SetUserResponse setUserResponse =
            SetUserResponse.fromMap(response.data);
        return RepoSuccess(message: response.message, data: setUserResponse);
      } else {
        return RepoFailure(
          error: (response as ApiFailure).errorMsg,
        );
      }
    } catch (_) {
      return RepoFailure(error: _.toString());
    }
  }
}
