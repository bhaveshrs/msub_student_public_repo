import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:msub/config/common_widgets/tost_msg.dart';
import 'package:msub/config/network_services/api_result_service.dart';
import 'package:msub/config/resource/storage_service.dart';
import 'package:msub/features/complete_profile/models/country_model.dart';
import 'package:msub/features/complete_profile/models/program_model.dart';
import 'package:msub/features/complete_profile/models/year_model.dart';
import 'package:msub/features/complete_profile/repo/complete_profile_repository.dart';

// import 'package:msub/view/onboarding/models/country_model.dart';
// import 'package:msub/view/onboarding/models/year_model.dart';

part 'complete_profile_event.dart';
part 'complete_profile_state.dart';

// class CompleteProfileBloc extends Bloc<CompleteProfileEvent, CompleteProfileState> {
//   CompleteProfileBloc() : super(CompleteProfileInitial()) {
//     on<CompleteProfileEvent>((event, emit) {
//       // TODO: implement event handler
//     });
//   }
// }

class CompleteProfileBloc
    extends Bloc<CompleteProfileEvent, CompleteProfileState> {
  final CompleteProfileRepository repository = CompleteProfileRepository();

  CompleteProfileBloc() : super(const CompleteProfileState()) {
    on<LoadProfileData>((event, emit) async {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

      try {
        // String? token = await StorageService().getSessionToken();
        String? token = await StorageService().getSessionToken();
        if (token != null) {
          RepoResult countriesResult = await repository.fetchCountries(
              payload: json.encode({'token': token}));
          RepoResult programmesResult = await repository.fetchProgrammes(
              payload: json.encode({'token': token}));
          RepoResult yearsResult = await repository.fetchYears(
              payload: json.encode({'token': token}));
          print(countriesResult);
          print(programmesResult);
          print(yearsResult);

          if (countriesResult is RepoSuccess &&
              programmesResult is RepoSuccess &&
              yearsResult is RepoSuccess) {
            List<CountryModel> countries = countriesResult.data;
            List<ProgramModel> programs = programmesResult.data;
            List<YearModel> years = yearsResult.data;

            emit(state.copyWith(
              status: FormzSubmissionStatus.success,
              countries: List.from(state.countries)..addAll(countries),
              programmes: List.from(state.programmes)..addAll(programs),
              years: List.from(state.years)..addAll(years),
            ));
            print(List.from(state.countries)..addAll(countries));
          } else {
            emit(state.copyWith(
                status: FormzSubmissionStatus.failure,
                errorMessage: "Failed to fetch data"));
          }
        } else {
          emit(state.copyWith(
              status: FormzSubmissionStatus.failure,
              errorMessage: "Failed to fetch data"));
        }
      } catch (e) {
        print(e);
        emit(state.copyWith(
            status: FormzSubmissionStatus.failure, errorMessage: e.toString()));
      }
    });

    // on<SubmitProfile>((event, emit) async {
    //   emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    //   try {
    //     RepoResult result = await repository.submitProfile(
    //         payload: json.encode(event.profileData));
    //     if (result is RepoSuccess) {
    //       emit(state.copyWith(status: FormzSubmissionStatus.success));
    //       showCustomToast("Profile Completed Successfully!", true);
    //     } else if (result is RepoFailure) {
    //       emit(state.copyWith(
    //           status: FormzSubmissionStatus.failure,
    //           errorMessage: (result).error));
    //       showCustomToast((result).error, false);
    //     }
    //   } catch (e) {
    //     emit(state.copyWith(
    //         status: FormzSubmissionStatus.failure, errorMessage: e.toString()));
    //   }
    // });

    on<SubmitProfile>((event, emit) async {
      emit(state.copyWith(
          completeProfileStatus: FormzSubmissionStatus.inProgress));

      try {
        String? token = await StorageService().getSessionToken();

        String? uploadedFileUrl;

        // 1️⃣ Upload file if selected
        if (token != null) {
          RepoResult profileResult = await repository.uploadFile(
              file: event.file,
              token: token,
              name: event.name,
              gender: event.selectedGender,
              permanentAddress: "Address",
              countryId: event.selectedCountry,
              dob: event.dob,
              nationalityId: event.selectedNationality,
              courseId: event.selectedProgramme,
              year: event.selectedYear);

          // if (uploadResult is RepoSuccess) {

          // } else if (uploadResult is RepoFailure) {
          //   emit(state.copyWith(
          //       status: FormzSubmissionStatus.failure,
          //       errorMessage: uploadResult.error));
          //   showCustomToast("File upload failed: ${uploadResult.error}", false);
          //   return;
          // }
          // }
          // String? token = await StorageService().getSessionToken();

          // 2️⃣ Call Student Registration API with File URL (if uploaded)
          // final profileData = {
          //   ...event.profileData,
          //   'token': token,
          //   if (uploadedFileUrl != null)
          //     "image_url":
          //         uploadedFileUrl, // Attach uploaded file URL if available
          // };

          // final profileResult =
          //     await repository.submitProfile(payload: json.encode(profileData));
          if (profileResult is RepoSuccess) {
            emit(state.copyWith(
                completeProfileStatus: FormzSubmissionStatus.success));
            showCustomToast("Profile Completed Successfully!", true);
          } else if (profileResult is RepoFailure) {
            emit(state.copyWith(
                completeProfileStatus: FormzSubmissionStatus.failure,
                errorMessage: profileResult.error));
            showCustomToast(profileResult.error, false);
          }
        } else {
          emit(state.copyWith(
              completeProfileStatus: FormzSubmissionStatus.failure,
              errorMessage: "Something went wrong"));
        }
      } catch (e) {
        emit(state.copyWith(
            completeProfileStatus: FormzSubmissionStatus.failure,
            errorMessage: e.toString()));
        showCustomToast("An error occurred: $e", false);
      }
    });
  }
}
