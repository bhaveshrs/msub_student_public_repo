import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:msub/config/common_widgets/tost_msg.dart';
import 'package:msub/config/network_services/api_result_service.dart';
import 'package:msub/features/forgot_pass/repo/forgotpass_repo.dart';
// import 'package:teachers_app/config/common_widgets/tost_msg.dart';
// import 'package:teachers_app/config/network_services/api_result_service.dart';
// import 'package:teachers_app/features/forgot_pass/repo/forgotpass_repo.dart';

part 'forgot_pass_event.dart';
part 'forgot_pass_state.dart';

class ForgotPassBloc extends Bloc<ForgotPassEvent, ForgotPassState> {
  ForgotPassBloc() : super(const ForgotPassState()) {
    ForgotPassRepository forgotPassRepo = ForgotPassRepository();
    on<SentForgotPassOtpEvent>((event, emit) async {
      try {
        emit(state.copyWith(
            sendEmailOtpStatus: FormzSubmissionStatus.inProgress,
            email: event.email,
            empId: event.empId));

        RepoResult response = await forgotPassRepo.sendForgotPassOtp(
            payload: json.encode(
                {"email": event.email, "prn_employee_id": event.empId}));

        if (response is RepoSuccess) {
          emit(state.copyWith(
              sendEmailOtpStatus: FormzSubmissionStatus.success,
              startFillOtp: true,
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
        emit(state.copyWith(verifyOtpStatus: FormzSubmissionStatus.inProgress));

        RepoResult response = await forgotPassRepo.verifyOtp(
            payload: json.encode({
          "email": state.email,
          "otp": event.otp,
          "prn_employee_id": state.empId
        }));
        if (response is RepoSuccess) {
          emit(state.copyWith(
              verifyOtpStatus: FormzSubmissionStatus.success, otp: event.otp
              // otpTimerText: formatTime(300), // Start with "5:00"
              // startFillOtp: true
              ));
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
            verifyOtpStatus: FormzSubmissionStatus.failure,
            error: msg != "" ? msg : (response).error,
          ));

          showCustomToast(msg != "" ? msg : (response).error, false);
        }
      } catch (e, s) {
        print(e);
        print(s);
        emit(state.copyWith(
          verifyOtpStatus: FormzSubmissionStatus.failure,
          error: "something went wrong",
        ));
        showCustomToast("something went wrong", false);
      }
    });

    on<ResetPassEvent>((event, emit) async {
      try {
        emit(state.copyWith(resetPassStatus: FormzSubmissionStatus.inProgress));

        RepoResult response = await forgotPassRepo.resetPass(
            payload: json.encode({
          "email": event.email,
          "password": event.password,
        }));
        print(response);
        if (response is RepoSuccess) {
          emit(state.copyWith(
            resetPassStatus: FormzSubmissionStatus.success,
            startTimer: true,
            // otpTimerText: formatTime(300), // Start with "5:00"
            // startFillOtp: true
          ));
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
            resetPassStatus: FormzSubmissionStatus.failure,
            error: msg != "" ? msg : (response).error,
          ));

          showCustomToast(msg != "" ? msg : (response).error, false);
        }
      } catch (e, s) {
        print(e);
        print(s);
        emit(state.copyWith(
          resetPassStatus: FormzSubmissionStatus.failure,
          error: "something went wrong",
        ));
        showCustomToast("something went wrong", false);
      }
    });
  }
}
