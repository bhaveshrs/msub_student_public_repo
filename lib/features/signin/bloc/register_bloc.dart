import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:msub/config/common_widgets/tost_msg.dart';
import 'package:msub/config/firbase_utils/firbase_notification_service.dart';
import 'package:msub/config/network_services/api_result_service.dart';
import 'package:msub/config/resource/storage_service.dart';
import 'package:msub/features/signin/bloc/register_state.dart';
import 'package:msub/features/signin/model/register_response_model.dart';
import 'package:msub/features/signin/repo/register_repo.dart';

part 'register_event.dart';

class SignInBloc extends Bloc<RegisterEvent, SignInState> {
  final RegisterRepository _registerRepo = RegisterRepository();

  SignInBloc() : super(const SignInState()) {
    String formatTime(int totalSeconds) {
      final minutes = (totalSeconds ~/ 60).toString().padLeft(2, '0');
      final seconds = (totalSeconds % 60).toString().padLeft(2, '0');
      return "$minutes:$seconds";
    }

    on<StartViaEmail>((event, emit) async {
      try {
        emit(state.copyWith(startFillOtp: true, email: event.email));
      } catch (e, s) {
        showCustomToast("something went wrong", false);
      }
    });

    on<SentOtpViaEmailEvent>((event, emit) async {
      try {
        emit(state.copyWith(
            sendEmailOtpStatus: FormzSubmissionStatus.inProgress,
            email: event.email));

        RepoResult response = await _registerRepo.sendOtpMai(
            payload: json.encode({"email": event.email}));
        if (response is RepoSuccess) {
          emit(state.copyWith(
              sendEmailOtpStatus: FormzSubmissionStatus.success,
              otpTimerText: formatTime(300), // Start with "5:00"
              startFillOtp: true,
              canResendOtp: false,
              startTimer: true));
          if (response.message != null && response.message != "") {
            showCustomToast(response.message!, true);
          }
        } else {
          List<String> errorMessages = [];
          if ((response as RepoFailure).data != null && response.data is Map) {
            final errors = response.data as Map<String, dynamic>;

            // Extract all error messages
            for (var fieldErrors in errors.values) {
              if (fieldErrors is List) {
                errorMessages.addAll(fieldErrors.map((e) => e.toString()));
              }
            }
          }
          String msg = errorMessages.isNotEmpty ? errorMessages.first : "";
          emit(state.copyWith(
            sendEmailOtpStatus: FormzSubmissionStatus.failure,
            error: msg != "" ? msg : (response).error,
          ));
          showCustomToast(msg != "" ? msg : (response).error, false);
        }
      } catch (e, s) {
        print(e);
        print(s);
        emit(state.copyWith(
          sendEmailOtpStatus: FormzSubmissionStatus.failure,
          error: "something went wrong",
        ));
        showCustomToast("something went wrong", false);
      }
    });

    on<OtpVerifyEvent>((event, emit) async {
      try {
        emit(state.copyWith(
            verifyOtpStatus: FormzSubmissionStatus.inProgress,
            sendEmailOtpStatus: FormzSubmissionStatus.success));
        RepoResult response = await _registerRepo.verifyOtp(
            payload: json.encode({
          "email": state.email,
          "otp": event.otp,
        }));
        if (response is RepoSuccess) {
          emit(state.copyWith(
              sendEmailOtpStatus: FormzSubmissionStatus.success,
              verifyOtpStatus: FormzSubmissionStatus.success,
              otpTimerText: formatTime(300), // Start with "5:00"
              startFillOtp: true));
          if (response.message != null && response.message != "") {
            showCustomToast(response.message!, true);
          }
        } else {
          String msg = (response as RepoFailure).data != null
              ? (response).data["email"][0]
              : "";
          emit(state.copyWith(
            sendEmailOtpStatus: FormzSubmissionStatus.success,
            verifyOtpStatus: FormzSubmissionStatus.failure,
            error: msg != "" ? msg : (response).error,
          ));
          showCustomToast(msg != "" ? msg : (response).error, false);
        }
      } catch (e, s) {
        print(e);
        print(s);
        emit(state.copyWith(
          sendEmailOtpStatus: FormzSubmissionStatus.success,
          verifyOtpStatus: FormzSubmissionStatus.failure,
          error: "something went wrong",
        ));
        showCustomToast("something went wrong", false);
      }
    });

    on<RegisterAPICallEvent>((event, emit) async {
      try {
        emit(state.copyWith(registerStatus: FormzSubmissionStatus.inProgress));
        String? fcmToken = await PushNotificationService().getToken();
        print("fcmToken ---->>> $fcmToken");
        if (fcmToken != null) {
          RepoResult response = await _registerRepo.register(
              payload: json.encode({
            "email": state.email,
            "password": event.password,
            "device_id": fcmToken
          }));
          print(response);

          if (response is RepoSuccess) {
            RegisterResponseModel registerResponseModel = response.data;
            await StorageService()
                .setSessionToken(registerResponseModel.token ?? "");
            emit(state.copyWith(
              registerStatus: FormzSubmissionStatus.success,
            ));
            if (response.message != null && response.message != "") {
              showCustomToast(response.message!, true);
            }
          } else {
            String msg = (response as RepoFailure).data != null
                ? (response).data[0]
                : "";
            emit(state.copyWith(
              registerStatus: FormzSubmissionStatus.failure,
              error: msg != "" ? msg : (response).error,
            ));
            showCustomToast(msg != "" ? msg : (response).error, false);
          }
        } else {
          emit(state.copyWith(
            sendEmailOtpStatus: FormzSubmissionStatus.success,
            verifyOtpStatus: FormzSubmissionStatus.failure,
            error: "someThing went wrong",
          ));
        }
      } catch (e) {
        print(e);
        emit(state.copyWith(
          registerStatus: FormzSubmissionStatus.failure,
          error: "something went wrong",
        ));
        showCustomToast("something went wrong", false);
      }
    });
  }
}
