// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:formz/formz.dart';
// import 'package:msub/config/common_widgets/app_dropdown.dart';
// import 'package:msub/config/common_widgets/app_textfild.dart';
// import 'package:msub/config/common_widgets/button.dart';
// import 'package:msub/config/resource/app_colors.dart';
// import 'package:msub/config/resource/app_textstyles.dart';
// import 'package:msub/features/complete_profile/bloc/complete_profile_bloc.dart';
// // import '../bloc/complete_profile_bloc.dart';
// // import '../bloc/complete_profile_event.dart';
// // import '../bloc/complete_profile_state.dart';

// class CompleteProfileScreen extends StatefulWidget {
//   const CompleteProfileScreen({super.key});

//   @override
//   _CompleteProfileScreenState createState() => _CompleteProfileScreenState();
// }

// class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController dobController = TextEditingController();
//   String? selectedGender;
//   String? selectedProgramme;
//   File? selectedFile;

//   @override
//   void initState() {
//     super.initState();
//     context
//         .read<CompleteProfileBloc>()
//         .add(LoadProfileData()); // Fetch dropdown data
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: BlocConsumer<CompleteProfileBloc, CompleteProfileState>(
//             listener: (context, state) {
//               if (state.status == FormzSubmissionStatus.success) {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(
//                       content: Text("Profile Completed Successfully!")),
//                 );
//               } else if (state.status == FormzSubmissionStatus.failure) {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                       content:
//                           Text(state.errorMessage ?? "Something went wrong")),
//                 );
//               }
//             },
//             builder: (context, state) {
//               if (state.status == FormzSubmissionStatus.inProgress) {
//                 return const Center(child: CircularProgressIndicator());
//               } else {
//                 return SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Complete Your Profile",
//                         style: AppTextStyles.rob20Semi(),
//                       ),
//                       const SizedBox(height: 20),

//                       // Name Input
//                       CustomTextInput(
//                         controller: nameController,
//                         hintText: "Enter your name",
//                       ),
//                       const SizedBox(height: 20),
//                       CommonDropdown(
//                         isExpanded: true,
//                         labelText: "Semester",
//                         items: const ['Male', 'Female', 'Other'],
//                         hintText: "Select",
//                         selectedValue: selectedGender,
//                         onChanged: (value) {
//                           setState(() => selectedGender = value);
//                         },
//                       ),

//                       // Gender Dropdown
//                       // CustomDropdown(
//                       //   items: ['Male', 'Female', 'Other'],
//                       //   hintText: 'Select Gender',
//                       //   selectedItem: selectedGender,
//                       //   onChanged: (value) =>
//                       //       setState(() => selectedGender = value),
//                       // ),
//                       const SizedBox(height: 20),
//                       CommonDropdown(
//                         isExpanded: true,
//                         labelText: "Semester",
//                         items:
//                             state.programmes.map((e) => e.name ?? "").toList(),
//                         hintText: "Select",
//                         selectedValue: selectedProgramme,
//                         onChanged: (value) {
//                           setState(() => selectedProgramme = value);
//                         },
//                       ),
//                       // Programme Dropdown
//                       // CustomDropdown(
//                       //   items:
//                       //       state.programmes.map((e) => e.name ?? "").toList(),
//                       //   hintText: 'Select Programme',
//                       //   selectedItem: selectedProgramme,
//                       //   onChanged: (value) =>
//                       //       setState(() => selectedProgramme = value),
//                       // ),
//                       const SizedBox(height: 20),

//                       // Date of Birth Input
//                       GestureDetector(
//                         onTap: () async {
//                           DateTime? selectedDate = await showDatePicker(
//                             context: context,
//                             initialDate: DateTime.now(),
//                             firstDate: DateTime(1900),
//                             lastDate: DateTime.now(),
//                           );
//                           if (selectedDate != null) {
//                             setState(() {
//                               dobController.text =
//                                   "${selectedDate.year}/${selectedDate.month}/${selectedDate.day}";
//                             });
//                           }
//                         },
//                         child: CustomTextInput(
//                           controller: dobController,
//                           hintText: "YY/MM/DD",
//                           enable: false,
//                         ),
//                       ),
//                       const SizedBox(height: 20),

//                       // Image Upload
//                       GestureDetector(
//                         onTap: () async {
//                           // Implement File Picker
//                         },
//                         child: Container(
//                           height: 120,
//                           width: 120,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(100),
//                             color: MyAppColors.white,
//                           ),
//                           child: selectedFile == null
//                               ? const Icon(Icons.camera_alt,
//                                   size: 50, color: Colors.grey)
//                               : Image.file(selectedFile!, fit: BoxFit.cover),
//                         ),
//                       ),
//                       const SizedBox(height: 40),

//                       // Submit Button
//                       AppButton(
//                         onPress: () {
//                           Map<String, dynamic> profileData = {
//                             "name": nameController.text,
//                             "gender": selectedGender,
//                             "dob": dobController.text,
//                             "programme": selectedProgramme,
//                           };
//                           context
//                               .read<CompleteProfileBloc>()
//                               .add(SubmitProfile(profileData, selectedFile));
//                         },
//                         buttonName: "Submit",
//                         buttonColor: MyAppColors.blue3,
//                       ),
//                     ],
//                   ),
//                 );
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:msub/common/utils/image_select.dart';
import 'package:msub/config/common_widgets/app_dropdown.dart';
import 'package:msub/config/common_widgets/button.dart';
import 'package:msub/config/common_widgets/tost_msg.dart';
import 'package:msub/config/resource/app_colors.dart';
import 'package:msub/config/resource/app_images.dart';
import 'package:msub/config/resource/app_textstyles.dart';
import 'package:msub/config/router/route_names.dart';
import 'package:msub/features/complete_profile/bloc/complete_profile_bloc.dart';
import 'package:msub/features/complete_profile/models/country_model.dart';
import 'package:msub/features/complete_profile/models/program_model.dart';
import 'package:msub/features/signup/bloc/sign_up_bloc.dart';

import '../../config/common_widgets/app_textfild.dart';

class CompleteProfileScreen extends StatefulWidget {
  final String? name;
  const CompleteProfileScreen({super.key, this.name});

  @override
  _CompleteProfileViewState createState() => _CompleteProfileViewState();
}

class _CompleteProfileViewState extends State<CompleteProfileScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  String? selectedGender;
  bool readonly = true;
  ProgramModel? selectedProgramme;
  String? selectedYear;
  // String? selectedCountry;
  CountryModel? selectedCountry;
  CountryModel? selectedNationality;
  File? selectedFile;

  @override
  void initState() {
    super.initState();

    context
        .read<CompleteProfileBloc>()
        .add(LoadProfileData()); // Fetch dropdown data
    if (context.read<SignUpBloc>().state.name != null) {
      nameController.text = context.read<SignUpBloc>().state.name!;
    } else if (widget.name != null) {
      nameController.text = widget.name!;
    }
    if (mounted) {
      setState(() {});
    }
  }

  void showChooseImageBottomSheet(
    BuildContext context,
  ) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: MyAppColors.white,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: AppButton(
                  onPress: () async {
                    Navigator.pop(context); // Close the bottom sheet
                    selectedFile = await pickImageCamera();
                    setState(() {});
                  },
                  buttonName: "Camera",
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: AppButton(
                  onPress: () async {
                    Navigator.pop(context); // Close the bottom sheet
                    selectedFile = await pickImageGallery();
                    setState(() {});
                  },
                  buttonName: "Gallery",
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyAppColors.white2,
      appBar: AppBar(
        backgroundColor: MyAppColors.white2,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: MyAppColors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: BlocConsumer<CompleteProfileBloc, CompleteProfileState>(
          listener: (context, state) {
            if (state.completeProfileStatus == FormzSubmissionStatus.success) {
              context.go(AppRouteNames.dashboardRoute);
              showCustomToast("Profile Completed Successfully!", true);
            } else if (state.completeProfileStatus ==
                FormzSubmissionStatus.failure) {
              showCustomToast(
                  state.errorMessage ?? "Something went wrong", true);
            }
          },
          builder: (context, state) {
            if (state.status == FormzSubmissionStatus.inProgress) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Complete Your Profile",
                        style: AppTextStyles.rob20Semi(),
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Text(
                          "Provide your basic information to set up your account.",
                          textAlign: TextAlign.center,
                          style: AppTextStyles.pop12Reg(
                              color: MyAppColors.inActiveText),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Profile Image Upload
                      Center(
                        child: Stack(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: MyAppColors.white,
                              ),
                              child: selectedFile == null
                                  ? const Icon(Icons.person,
                                      size: 50, color: MyAppColors.grey)
                                  : ClipOval(
                                      child: Image.file(selectedFile!,
                                          fit: BoxFit.cover)),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: GestureDetector(
                                onTap: () async {
                                  showChooseImageBottomSheet(context);
                                  // TODO: Implement file picker
                                },
                                child: const CircleAvatar(
                                  backgroundColor: MyAppColors.black,
                                  radius: 15,
                                  child: Icon(Icons.add,
                                      color: MyAppColors.white, size: 16),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      CustomTextInput(
                        maxLines: 1,
                        readOnly: readonly,
                        suffixIcon: readonly
                            ? Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: GestureDetector(
                                  onTap: () {
                                    readonly = false;
                                    setState(() {});
                                  },
                                  child: SvgPicture.asset(
                                    AppImages.edit,
                                    height: 18,
                                    width: 18,
                                  ),
                                ),
                              )
                            : null,
                        controller: nameController,
                        labelText: "Name *",
                        hintText: "Enter your name",
                        textAlignment: TextAlign.start,
                      ),
                      const SizedBox(height: 20),

                      // Programme Dropdown
                      CommonDropdown(
                        isExpanded: true,
                        labelText: "Programme *",
                        items:
                            state.programmes.map((e) => e.name ?? "").toList(),
                        selectedValue: selectedProgramme?.name,
                        hintText: "Select Program",
                        onChanged: (value) => setState(() {
                          selectedProgramme = state.programmes
                              .firstWhere((e) => e.name == value);
                        }),
                      ),
                      const SizedBox(height: 20),

                      // Year Dropdown
                      CommonDropdown(
                        isExpanded: true,
                        labelText: "Year *",
                        items:
                            state.years.map((e) => e.year.toString()).toList(),
                        selectedValue: selectedYear,
                        hintText: "Select your year of study",
                        onChanged: (value) =>
                            setState(() => selectedYear = value),
                      ),
                      const SizedBox(height: 20),

                      // Date of Birth & Gender Row
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextInput(
                              controller: dobController,
                              labelText: "Date of Birth *",
                              hintText: "DD/MM/YY",
                              readOnly: true,
                              prefixIcon: SvgPicture.asset(AppImages.calendar),
                              onTap: () async {
                                DateTime? selectedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now(),
                                );
                                if (selectedDate != null) {
                                  setState(() {
                                    dobController.text =
                                        "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}";
                                  });
                                }
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: CommonDropdown(
                              isExpanded: true,
                              isDense: false,
                              labelText: "Gender *",
                              items: const ['male', 'female'],
                              selectedValue: selectedGender,
                              hintText: "Select",
                              onChanged: (value) =>
                                  setState(() => selectedGender = value),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Country of Residency Dropdown
                      CommonDropdown(
                          isExpanded: true,
                          labelText: "Country of Residency *",
                          items:
                              state.countries.map((e) => e.name ?? "").toList(),
                          selectedValue: selectedCountry?.name,
                          hintText: "Select",
                          onChanged: (value) => setState(() {
                                selectedCountry = state.countries
                                    .firstWhere((e) => e.name == value);
                              })),
                      const SizedBox(height: 20),

                      // Nationality Dropdown
                      CommonDropdown(
                          isExpanded: true,
                          labelText: "Nationality *",
                          items:
                              state.countries.map((e) => e.name ?? "").toList(),
                          selectedValue: selectedNationality?.name,
                          hintText: "Select",
                          onChanged: (value) => setState(() {
                                selectedNationality = state.countries
                                    .firstWhere((e) => e.name == value);
                              })),
                      const SizedBox(height: 40),
                      AppButton(
                        loading: state.completeProfileStatus.isInProgress,
                        onPress: () {
                          if (nameController.text.isEmpty ||
                              dobController.text.isEmpty ||
                              selectedCountry == null ||
                              selectedGender == null ||
                              selectedNationality == null ||
                              selectedProgramme == null ||
                              selectedYear == null) {
                            showCustomToast(
                                "Please fill all required fields!", false);
                            return;
                          }
                          context.read<CompleteProfileBloc>().add(SubmitProfile(
                                dob: dobController.text,
                                name: nameController.text,
                                selectedCountry:
                                    (selectedCountry?.id).toString(),
                                selectedGender: selectedGender!,
                                selectedNationality:
                                    (selectedNationality?.id).toString(),
                                selectedProgramme:
                                    (selectedProgramme?.id).toString(),
                                selectedYear: selectedYear!,
                                file: selectedFile, // File is optional
                              ));
                        },
                        buttonName: "Sign Up",
                        buttonColor: MyAppColors.blue3,
                      ),
                      const SizedBox(
                        height: 25,
                      )
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
