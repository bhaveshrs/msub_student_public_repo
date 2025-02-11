part of 'sign_up_bloc.dart';


abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object?> get props => [];
}

class PRNEnteredEvent extends SignUpEvent {
  final String prn;
  const PRNEnteredEvent({required this.prn});
  @override
  List<Object> get props => [prn];
}

class UpdateUserNameEvent extends SignUpEvent {
  final String prn;
  final String name;
  const UpdateUserNameEvent({required this.prn, required this.name});
  @override
  List<Object> get props => [prn, name];
}
