part of 'sign_up_verify_bloc.dart';


abstract class SignUpVerifyEvent extends Equatable {
  const SignUpVerifyEvent();
  @override
  List<Object?> get props => [];
}

// Mobile OTP Events
class SendMobileOtpEvent extends SignUpVerifyEvent {
  final String prn;
  final String mobile;
  const SendMobileOtpEvent({required this.prn, required this.mobile});
  @override
  List<Object> get props => [prn, mobile];
}

class VerifyMobileOtpEvent extends SignUpVerifyEvent {
  final String prn;
  final String mobile;
  final String otp;
  const VerifyMobileOtpEvent({required this.prn, required this.mobile, required this.otp});
  @override
  List<Object> get props => [prn, mobile, otp];
}

// Email OTP Events
class SendEmailOtpEvent extends SignUpVerifyEvent {
  final String prn;
  final String email;
  const SendEmailOtpEvent({required this.prn, required this.email});
  @override
  List<Object> get props => [prn, email];
}

class VerifyEmailOtpEvent extends SignUpVerifyEvent {
  final String prn;
  final String email;
  final String otp;
  const VerifyEmailOtpEvent({required this.prn, required this.email, required this.otp});
  @override
  List<Object> get props => [prn, email, otp];
}

// Create Password Event
class CreatePasswordEvent extends SignUpVerifyEvent {
  final String prn;
  final String email;
  final String password;
  const CreatePasswordEvent({required this.prn, required this.email, required this.password});
  @override
  List<Object> get props => [prn, email, password];
}
