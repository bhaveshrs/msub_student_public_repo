// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'forgot_pass_bloc.dart';

class ForgotPassState extends Equatable {
  final FormzSubmissionStatus sendEmailOtpStatus;
  final FormzSubmissionStatus verifyOtpStatus;
  final FormzSubmissionStatus resetPassStatus;
  final bool startFillOtp;
  final bool startTimer;
  final String? email;
  final String? otp;
  final String? empId;
  final String? error;
  final String? password;

  const ForgotPassState({
    this.sendEmailOtpStatus = FormzSubmissionStatus.initial,
    this.verifyOtpStatus = FormzSubmissionStatus.initial,
    this.resetPassStatus = FormzSubmissionStatus.initial,
    this.startFillOtp = false,
    this.startTimer = false,
    this.email,
    this.otp,
    this.empId,
    this.error,
    this.password,
  });

  @override
  List<Object?> get props => [
        sendEmailOtpStatus,
        verifyOtpStatus,
        resetPassStatus,
        email,
        error,
        startFillOtp,
        empId,
        password,
        startTimer,
        otp
      ];

  ForgotPassState copyWith(
      {FormzSubmissionStatus? sendEmailOtpStatus,
      FormzSubmissionStatus? verifyOtpStatus,
      FormzSubmissionStatus? resetPassStatus,
      String? email,
      String? otp,
      String? empId,
      String? error,
      String? password,
      bool? startFillOtp,
      bool? startTimer}) {
    return ForgotPassState(
      startFillOtp: startFillOtp ?? this.startFillOtp,
      startTimer: startTimer ?? false,
      sendEmailOtpStatus: sendEmailOtpStatus ?? this.sendEmailOtpStatus,
      verifyOtpStatus: verifyOtpStatus ?? this.verifyOtpStatus,
      resetPassStatus: resetPassStatus ?? this.resetPassStatus,
      email: email ?? this.email,
      otp: otp ?? this.otp,
      password: password ?? this.password,
      empId: empId ?? this.empId,
      error: error ?? this.error,
    );
  }
}
