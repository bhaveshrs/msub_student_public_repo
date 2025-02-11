import 'dart:io';

import 'package:msub/config/network_services/api_result.dart';
import 'package:msub/config/network_services/api_result_service.dart';
import 'package:msub/features/complete_profile/models/country_model.dart';
import 'package:msub/features/complete_profile/models/program_model.dart';
import 'package:msub/features/complete_profile/models/year_model.dart';

import '../service/complete_profile_service.dart';

class CompleteProfileRepository {
  CompleteProfileService service = CompleteProfileService();

  Future<RepoResult> fetchCountries({required payload}) async {
    try {
      final response =
          await commonApiCall(service.getCountries(payload: payload));

      if (response is ApiSuccess) {
        print(response.data);
        List<CountryModel> countryList = (response.data as List)
            .map((json) => CountryModel.fromMap(json))
            .toList();
        return RepoSuccess(
          data: countryList,
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

  Future<RepoResult> fetchProgrammes({required payload}) async {
    try {
      final response =
          await commonApiCall(service.getProgrammes(payload: payload));

      if (response is ApiSuccess) {
        List<ProgramModel> programList = (response.data as List)
            .map((json) => ProgramModel.fromMap(json))
            .toList();
        return RepoSuccess(
          data: programList,
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

  Future<RepoResult> fetchYears({required payload}) async {
    try {
      final response = await commonApiCall(service.getYears(payload: payload));

      if (response is ApiSuccess) {
        List<YearModel> yearList = (response.data as List)
            .map((json) => YearModel.fromMap(json))
            .toList();
        return RepoSuccess(
          data: yearList,
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

  Future<RepoResult> uploadFile({
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
      final response = await commonApiCall(service.uploadFile(
        file: file,
        token: token,
        name: name,
        gender: gender,
        permanentAddress: permanentAddress,
        countryId: countryId,
        dob: dob,
        nationalityId: nationalityId,
        courseId: courseId,
        year: year,
      ));

      if (response is ApiSuccess) {
        return RepoSuccess(
          data: response.data,
          message: response.message,
        );
      } else {
        return RepoFailure(
            error: (response as ApiFailure).errorMsg, data: (response).errors);
      }
    } catch (e) {
      return RepoFailure(error: e.toString());
    }
  }

  // Future<RepoResult> uploadFile(File file) async {
  //   try {
  //     final response = await commonApiCall(service.uploadFile(file));

  //     if (response is ApiSuccess) {
  //       return RepoSuccess(
  //         data: response.data,
  //         message: response.message,
  //       );
  //     } else {
  //       return RepoFailure(
  //           error: (response as ApiFailure).errorMsg, data: (response).errors);
  //     }
  //   } catch (_) {
  //     return RepoFailure(error: _.toString());
  //   }
  // }

  Future<RepoResult> submitProfile({required payload}) async {
    try {
      final response =
          await commonApiCall(service.completeProfile(payload: payload));

      if (response is ApiSuccess) {
        return RepoSuccess(
          data: response.data,
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

  // Future<RepoResult> fetchCountries() => service.getCountries();
  // Future<ApiResult> fetchProgrammes() => service.getProgrammes();
  // Future<ApiResult> fetchYears() => service.getYears();
  // Future<ApiResult> submitProfile(
  //   Map<String, dynamic> profileData,
  // ) =>
  //     service.completeProfile(
  //       profileData,
  //     );
}
