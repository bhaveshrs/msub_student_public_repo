part of 'sign_up_verify_bloc.dart';

class SignUpVerifyState extends Equatable {
  final FormzSubmissionStatus sendEmailOtpStatus;
  final FormzSubmissionStatus verifyEmailOtpStatus;
  final FormzSubmissionStatus sendMobileOtpStatus;
  final FormzSubmissionStatus verifyMobileOtpStatus;
  final FormzSubmissionStatus createPasswordStatus;
  final bool? startTimerForMobile;
  final bool startTimerForEmail;
  final bool isPasswordCreated;
  final String? error;

  const SignUpVerifyState({
    this.sendEmailOtpStatus = FormzSubmissionStatus.initial,
    this.verifyEmailOtpStatus = FormzSubmissionStatus.initial,
    this.sendMobileOtpStatus = FormzSubmissionStatus.initial,
    this.verifyMobileOtpStatus = FormzSubmissionStatus.initial,
    this.createPasswordStatus = FormzSubmissionStatus.initial,
    this.startTimerForMobile = false,
    this.startTimerForEmail = false,
    this.isPasswordCreated = false,
    this.error,
  });

  SignUpVerifyState copyWith({
    FormzSubmissionStatus? sendEmailOtpStatus,
    FormzSubmissionStatus? verifyEmailOtpStatus,
    FormzSubmissionStatus? sendMobileOtpStatus,
    FormzSubmissionStatus? verifyMobileOtpStatus,
    FormzSubmissionStatus? createPasswordStatus,
    bool? startTimerForMobile,
    bool? startTimerForEmail,
    bool? isPasswordCreated,
    String? error,
  }) {
    return SignUpVerifyState(
      sendEmailOtpStatus: sendEmailOtpStatus ?? this.sendEmailOtpStatus,
      verifyEmailOtpStatus: verifyEmailOtpStatus ?? this.verifyEmailOtpStatus,
      sendMobileOtpStatus: sendMobileOtpStatus ?? this.sendMobileOtpStatus,
      verifyMobileOtpStatus:
          verifyMobileOtpStatus ?? this.verifyMobileOtpStatus,
      createPasswordStatus: createPasswordStatus ?? this.createPasswordStatus,
      startTimerForMobile: startTimerForMobile ?? false,
      startTimerForEmail: startTimerForEmail ?? false,
      isPasswordCreated: isPasswordCreated ?? this.isPasswordCreated,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        sendEmailOtpStatus,
        verifyEmailOtpStatus,
        sendMobileOtpStatus,
        verifyMobileOtpStatus,
        createPasswordStatus,
        startTimerForMobile,
        startTimerForEmail,
        isPasswordCreated,
        error,
      ];
}
