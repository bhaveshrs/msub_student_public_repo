// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class SignInState extends Equatable {
  final FormzSubmissionStatus registerStatus;
  final FormzSubmissionStatus sendEmailOtpStatus;
  final FormzSubmissionStatus verifyOtpStatus;
  final bool startFillOtp;
  final bool startTimer;
  final String? otpTimerText;
  final bool canResendOtp;

  final String? email;
  final String? password;
  final String? confirmPassword;
  // final String? otp;
  final String? error;

  const SignInState({
    // this.otp,
    this.registerStatus = FormzSubmissionStatus.initial,
    this.sendEmailOtpStatus = FormzSubmissionStatus.initial,
    this.verifyOtpStatus = FormzSubmissionStatus.initial,
    this.startFillOtp = false,
    this.startTimer = false,
    this.otpTimerText,
    this.canResendOtp = false,
    this.email,
    this.password,
    this.confirmPassword,
    this.error,
  });

  SignInState copyWith({
    FormzSubmissionStatus? registerStatus,
    FormzSubmissionStatus? sendEmailOtpStatus,
    FormzSubmissionStatus? verifyOtpStatus,
    bool? startFillOtp,
    bool? startTimer,
    String? email,
    String? otpTimerText,
    bool? canResendOtp,
    String? password,
    String? confirmPassword,
    String? otp,
    String? error,
  }) {
    return SignInState(
      otpTimerText: otpTimerText ?? this.otpTimerText,
      canResendOtp: canResendOtp ?? this.canResendOtp,
      startFillOtp: startFillOtp ?? this.startFillOtp,
      startTimer: startTimer ?? false,
      sendEmailOtpStatus: sendEmailOtpStatus ?? FormzSubmissionStatus.initial,
      // otp: otp ?? this.otp,
      registerStatus: registerStatus ?? FormzSubmissionStatus.initial,
      verifyOtpStatus: verifyOtpStatus ?? this.verifyOtpStatus,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props {
    return [
      startFillOtp,
      sendEmailOtpStatus,
      registerStatus,
      email,
      password,
      confirmPassword,
      error,
      otpTimerText,
      canResendOtp,
      verifyOtpStatus
    ];
  }
}
