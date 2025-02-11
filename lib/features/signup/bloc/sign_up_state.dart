part of 'sign_up_bloc.dart';

class SignUpState extends Equatable {
  final FormzSubmissionStatus checkUserStatus;
  final FormzSubmissionStatus updateUserStatus;
  final bool getName;
  final String? prn;
  final String? name;
  final String? error;

  const SignUpState({
    this.checkUserStatus = FormzSubmissionStatus.initial,
    this.updateUserStatus = FormzSubmissionStatus.initial,
    this.getName = false,
    this.prn,
    this.name,
    this.error,
  });

  SignUpState copyWith({
    FormzSubmissionStatus? checkUserStatus,
    FormzSubmissionStatus? updateUserStatus,
    bool? getName,
    String? prn,
    String? name,
    String? error,
  }) {
    return SignUpState(
      checkUserStatus: checkUserStatus ?? this.checkUserStatus,
      updateUserStatus: updateUserStatus ?? this.updateUserStatus,
      getName: getName ?? false,
      prn: prn ?? this.prn,
      name: name ?? this.name,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props =>
      [checkUserStatus, updateUserStatus, prn, name, error, getName];
}
