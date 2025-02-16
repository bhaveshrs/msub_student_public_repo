// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'forgot_pass_bloc.dart';

abstract class ForgotPassEvent extends Equatable {
  const ForgotPassEvent();

  @override
  List<Object> get props => [];
}

class SentForgotPassOtpEvent extends ForgotPassEvent {
  const SentForgotPassOtpEvent({
    required this.email,

    required this.empId,
  });

  final String email;
  final String empId;

  @override
  List<Object> get props => [email, empId];
}

class OtpVerifyEvent extends ForgotPassEvent {
  const OtpVerifyEvent({required this.otp});

  final String otp;

  @override
  List<Object> get props => [otp];
}

class ResetPassEvent extends ForgotPassEvent {
  const ResetPassEvent({required this.password, required this.email,required this.prn});

  final String password;
  final String email;
  final String prn;

  @override
  List<Object> get props => [password, email, prn];
}
