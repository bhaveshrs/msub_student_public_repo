// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
  @override
  List<Object?> get props => [];
}

class StartViaEmail extends RegisterEvent {
  const StartViaEmail({required this.email});
  final String email;
  @override
  List<Object?> get props => [];
}

class SentOtpViaEmailEvent extends RegisterEvent {
  const SentOtpViaEmailEvent({required this.email});

  final String email;

  @override
  List<Object> get props => [email];
}

class OtpVerifyEvent extends RegisterEvent {
  const OtpVerifyEvent({required this.otp});

  final String otp;

  @override
  List<Object> get props => [otp];
}

class RegisterAPICallEvent extends RegisterEvent {
  const RegisterAPICallEvent({
    required this.password,
    required this.deviceId,
  });
  final String password;
  final String deviceId;
  @override
  List<Object> get props => [password, deviceId];
}

class LastNameEvent extends RegisterEvent {
  const LastNameEvent({required this.lastName});

  final String lastName;

  @override
  List<Object> get props => [lastName];
}

class EmailEvent extends RegisterEvent {
  const EmailEvent({required this.email});

  final String email;

  @override
  List<Object?> get props => [email];
}

class PasswordEvent extends RegisterEvent {
  const PasswordEvent({required this.password, required this.confirmPassword});

  final String password;
  final String confirmPassword;

  @override
  List<Object> get props => [password];
}
