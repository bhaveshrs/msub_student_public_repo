import 'dart:io';

import 'package:dio/dio.dart';
import 'package:msub/config/network_services/api_client.dart';
import 'package:msub/config/network_services/api_result.dart';
import 'package:msub/config/resource/apis_end_points.dart';

// import '../model/country_model.dart';
// import '../model/programme_model.dart';
// import '../model/year_model.dart';

class CompleteProfileService {
  final DioClient _dioClient = DioClient();
  Future<ApiResult> getCountries({payload}) async {
    return await DioClient().post(ApisEndPoints.getCountries, data: payload);
  }

  Future<ApiResult> getProgrammes({payload}) async {
    return await DioClient().post(ApisEndPoints.getProgrammes, data: payload);
  }

  Future<ApiResult> getYears({payload}) async {
    return await DioClient().post(ApisEndPoints.getYears, data: payload);
  }

  Future<ApiResult> uploadFile({
    File? file,
    required String token,
    required String name,
    required String gender,
    required String permanentAddress,
    required String countryId,
    required String dob,
    required String nationalityId,
    required String courseId,
    required String year,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        "token": token,
        "name": name,
        "gender": gender,
        "permanent_address": permanentAddress,
        "country_id": countryId,
        "dob": dob,
        "nationality_id": nationalityId,
        "course_id": courseId,
        "year": year,

        // "image": await MultipartFile.fromFile(file.path,
        //     filename: file.path.split('/').last),
      });
      if (file != null && file.path.isNotEmpty) {
        formData.files.add(MapEntry(
          "image",
          await MultipartFile.fromFile(file.path,
              filename: file.path.split('/').last),
        ));
      }

      return await _dioClient.postMultipartFile(
        ApisEndPoints
            .studentRegistration, // Ensure the correct API endpoint is used
        data: formData,
      );
    } catch (e) {
      return ApiFailure(errorMsg: e.toString());
    }
  }

  // Future<ApiResult> uploadFile(File file) async {
  //   FormData formData = FormData.fromMap({
  //     "image": await MultipartFile.fromFile(file.path,
  //         filename: file.path.split('/').last),
  //   });

  //   return await _dioClient.postMultipartFile(
  //     ApisEndPoints.studentRegistration, // File upload API
  //     data: formData,
  //   );
  // }

  Future<ApiResult> completeProfile({payload}) async {
    ApiResult apiResult = await DioClient().post(
      ApisEndPoints.studentRegistration,
      data: payload,
    );
    return apiResult;
  }
}
