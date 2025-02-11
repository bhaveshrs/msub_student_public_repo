part of 'complete_profile_bloc.dart';

abstract class CompleteProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadProfileData extends CompleteProfileEvent {}

class SubmitProfile extends CompleteProfileEvent {
  // final Map<String, dynamic> profileData;
  final String name;
  final String selectedGender;
  final String dob;
  final String selectedProgramme;
  final String selectedYear;
  final String selectedCountry;
  final String selectedNationality;
  final File? file;

  SubmitProfile(
      {this.file,
      required this.name,
      required this.selectedGender,
      required this.dob,
      required this.selectedProgramme,
      required this.selectedYear,
      required this.selectedCountry,
      required this.selectedNationality});

  @override
  List<Object?> get props => [
        name,
        selectedGender,
        dob,
        selectedProgramme,
        selectedYear,
        selectedCountry,
        selectedNationality,
        file
      ];
}
