part of 'complete_profile_bloc.dart';

class CompleteProfileState extends Equatable {
  final FormzSubmissionStatus status;
  final FormzSubmissionStatus completeProfileStatus;
  final List<CountryModel> countries;
  final List<ProgramModel> programmes;
  final List<YearModel> years;
  final String? errorMessage;

  const CompleteProfileState({
    this.status = FormzSubmissionStatus.initial,
    this.completeProfileStatus = FormzSubmissionStatus.initial,
    this.countries = const [],
    this.programmes = const [],
    this.years = const [],
    this.errorMessage,
  });

  CompleteProfileState copyWith({
    FormzSubmissionStatus? status,
    FormzSubmissionStatus? completeProfileStatus,
    List<CountryModel>? countries,
    List<ProgramModel>? programmes,
    List<YearModel>? years,
    String? errorMessage,
  }) {
    return CompleteProfileState(
      status: status ?? this.status,
      completeProfileStatus:
          completeProfileStatus ?? this.completeProfileStatus,
      countries: countries ?? this.countries,
      programmes: programmes ?? this.programmes,
      years: years ?? this.years,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props =>
      [status, countries, programmes, years, errorMessage,completeProfileStatus];
}
