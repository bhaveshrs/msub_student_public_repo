import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msub/view/onboarding/controllers/complete_profile_view_controller.dart';

import '../../../common/utils/app_colors.dart';
import '../../../common/utils/assets.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_drop_down.dart';
import '../../../widgets/custom_input_text.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/size_space.dart';

class CompleteProfileView extends StatelessWidget {
  CompleteProfileView({super.key});

  final CompleteProfileViewController controller = Get.put(CompleteProfileViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: Get.height ,
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: AppColors.white2,

          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Height(height: 30),
                const CustomText(
                  "Complete Your Profile",
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black,
                ),
                const Height(height: 10),
                const CustomText(
                  "Provide your basic information to set up your account.",
                  textAlign: TextAlign.center,
                  fontSize: 16,
                  color: AppColors.inActive,
                ),
                const Height(height: 20),
                Obx(
                  () => Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.bottomSheet(chooseImageBottomSheet(controller, context));
                        },
                        child: Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: AppColors.white,
                          ),
                          child: ClipOval(
                            child: controller.file.value == null || controller.file.value!.path.isEmpty
                                ? Image.asset(
                                    Assets.logo,
                                    fit: BoxFit.cover,
                                  )
                                : Image.file(
                                    File(controller.file.value!.path),
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 0,
                        right: 0,
                        child: Icon(
                          Icons.add_circle,
                          color: AppColors.black,
                          size: 35,
                        ),
                      ),
                    ],
                  ),
                ),
                const Height(height: 40),
                const Align(
                  alignment: Alignment.topLeft,
                  child: CustomText(
                    "Name *",
                    textAlign: TextAlign.start,
                    fontSize: 16,
                    color: AppColors.textPrimary,
                  ),
                ).paddingOnly(left: 10),
                const Height(height: 10),
                CustomTextInput(
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      controller.isUserIdEmpty.value = true;
                    } else {
                      controller.isUserIdEmpty.value = false;
                    }
                  },
                  controller: controller.nameController,
                  keyboardType: TextInputType.text,
                  hintText: "Enter your name",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password cannot be empty";
                    }
                    return null; // Return null if all conditions are met
                  },
                  successMessage: "",
                  errorMessage: "Please enter a name.",
                  validateOnInputChange: true,
                  showValidationIcons: true,
                ),
                const Height(height: 20),
                const Align(
                  alignment: Alignment.topLeft,
                  child: CustomText(
                    "Programme *",
                    textAlign: TextAlign.start,
                    fontSize: 16,
                    color: AppColors.textPrimary,
                  ),
                ).paddingOnly(left: 10),
                const Height(height: 10),
                Obx(() {
                  List<String> programmeNames = controller.programmeList.map((program) => program.name ?? "").toSet().toList();

                  if (!programmeNames.contains(controller.selectedProgram)) {
                    controller.selectedProgram = null;
                  }

                  return CustomDropdown(
                    items: programmeNames,
                    hintText: 'Select',

                    selectedItem: controller.selectedProgram,
                    onChanged: (value) {
                      controller.selectedProgram = value;

                      final selectedItem = controller.programmeList.firstWhere(
                        (program) => program.name == value,
                      );
                      controller.selectedProgrammer.value = "${selectedItem.id}";

                      log("Selected Country ID: ${selectedItem.id}");
                    },
                  );
                }),
                const Height(height: 20),
                const Align(
                  alignment: Alignment.topLeft,
                  child: CustomText(
                    "Year *",
                    textAlign: TextAlign.start,
                    fontSize: 16,
                    color: AppColors.textPrimary,
                  ),
                ).paddingOnly(left: 10),
                const Height(height: 10),
                Obx(() {
                  List<String> years = controller.yearList.map((year) => year.year.toString() ?? "").toSet().toList();

                  if (!years.contains(controller.selectedYear)) {
                    controller.selectedYear = null;
                  }

                  return CustomDropdown(
                    items: years,
                    hintText: 'Select Year',
                    selectedItem: controller.selectedYear,
                    onChanged: (value) {
                      controller.selectedYear = value;

                      final selectedItem = controller.yearList.firstWhere(
                        (year) => year.year == value,
                      );
                      controller.selectedYearDropDown.value = "${selectedItem.id}";
                      controller.selectedYearId = "${selectedItem.id}";
                      log("Selected Country ID: ${controller.selectedYearId}");
                    },
                  );
                }),
                const Height(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.topLeft,
                            child: CustomText(
                              "Date of Birth *",
                              textAlign: TextAlign.start,
                              fontSize: 16,
                              color: AppColors.textPrimary,
                            ),
                          ).paddingOnly(left: 10),
                          const Height(height: 10),
                          GestureDetector(
                            onTap: () async {
                              await controller.selectDateOfBirth(context);
                            },
                            child: CustomTextInput(
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  controller.isUserIdEmpty.value = true;
                                } else {
                                  controller.isUserIdEmpty.value = false;
                                }
                              },
                              enable: false,
                              controller: controller.dobController,
                              keyboardType: TextInputType.text,
                              hintText: "YY/MM/DD",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Password cannot be empty";
                                }
                                return null;
                              },
                         //     successMessage: "Vaild PRN",
                            //  errorMessage: "Please enter a valid PRN.",
                              validateOnInputChange: true,
                          //    showValidationIcons: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Width(width: 10),
                    Expanded(
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.topLeft,
                            child: CustomText(
                              "Gender *",
                              textAlign: TextAlign.start,
                              fontSize: 16,
                              color: AppColors.textPrimary,
                            ),
                          ).paddingOnly(left: 10),
                          const Height(height: 10),
                          CustomDropdown(
                            items: const ['Male', 'Female', 'Other'],
                            hintText: 'Select',
                            selectedItem: controller.selectedGender,
                            onChanged: (value) {
                              controller.selectedGender = value;
                            },
                          ),

                          const Height(height: 10),
                        ],
                      ),
                    )
                  ],
                ),
                const Height(height: 20),
                const Align(
                  alignment: Alignment.topLeft,
                  child: CustomText(
                    "Country of Residency *",
                    textAlign: TextAlign.start,
                    fontSize: 16,
                    color: AppColors.textPrimary,
                  ),
                ).paddingOnly(left: 10),
                const Height(height: 10),
                Obx(() {
                  List<String> countryNames = controller.countriesList.map((country) => country.name ?? "").toSet().toList();

                  if (!countryNames.contains(controller.selectedCountries)) {
                    controller.selectedCountries = null;
                  }

                  return CustomDropdown(
                    items: countryNames,
                    hintText: 'Select Country',
                    selectedItem: controller.selectedCountries,
                    onChanged: (value) {
                      controller.selectedCountries = value;

                      final selectedItem = controller.countriesList.firstWhere(
                        (country) => country.name == value,
                      );
                      controller.selectedCountry.value = "${selectedItem.id}";

                      log("Selected Country ID: ${selectedItem.id}");
                    },
                  );
                }),
                const Height(height: 20),
                const Align(
                  alignment: Alignment.topLeft,
                  child: CustomText(
                    "Nationality *",
                    textAlign: TextAlign.start,
                    fontSize: 16,
                    color: AppColors.textPrimary,
                  ),
                ).paddingOnly(left: 10),
                const Height(height: 10),
                Obx(() {
                  List<String> countryNames = controller.nationalityList.map((country) => country.name ?? "").toSet().toList();

                  if (!countryNames.contains(controller.selectedNationality)) {
                    controller.selectedNationality = null;
                  }

                  return CustomDropdown(
                    items: countryNames,
                    hintText: 'Select Country',
                    selectedItem: controller.selectedNationality,
                    onChanged: (value) {
                      controller.selectedNationality = value;

                      final selectedItem = controller.countriesList.firstWhere(
                        (country) => country.name == value,
                      );
                      controller.selectedNationalityDropdown.value = "${selectedItem.id}";

                      log("Selected Country ID: ${selectedItem.id}");
                    },
                  );
                }),
                // CustomDropdown(
                //   items: ['India', 'Us', 'Canada'],
                //   hintText: 'Select',
                //   selectedItem: controller.selectedProgram,
                //   onChanged: (value) {
                //     controller.selectedProgram = value;
                //   },
                // ),
                // const Height(height: 20),
                // const Align(
                //   alignment: Alignment.topLeft,
                //   child: CustomText(
                //     "Enter Mobile Number",
                //     textAlign: TextAlign.start,
                //     fontSize: 16,
                //     color: AppColors.textPrimary,
                //   ),
                // ).paddingOnly(left: 10),
                // const Height(height: 10),
                // CustomTextInput(
                //   onChanged: (value) {
                //     if (value.isNotEmpty) {
                //       controller.isUserIdEmpty.value = true;
                //     } else {
                //       controller.isUserIdEmpty.value = false;
                //     }
                //   },
                //   controller: controller.mobileController,
                //   keyboardType: TextInputType.phone,
                //   hintText: "123456789",
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return "Password cannot be empty";
                //     }
                //     return null; //
                //   },
                //   successMessage: "Vaild Mobile Number ",
                //   errorMessage: "Please enter a valid Mobile Number.",
                //   validateOnInputChange: true,
                //   showValidationIcons: true,
                // ),
                // const Height(height: 20),
                // const Align(
                //   alignment: Alignment.topLeft,
                //   child: CustomText(
                //     "Enter Email Address",
                //     textAlign: TextAlign.start,
                //     fontSize: 16,
                //     color: AppColors.textPrimary,
                //   ),
                // ).paddingOnly(left: 10),
                // const Height(height: 10),
                // CustomTextInput(
                //   onChanged: (value) {
                //     // if (value.isNotEmpty) {
                //     //   controller.isUserIdEmpty.value = true;
                //     // } else {
                //     //   controller.isUserIdEmpty.value = false;
                //     // }
                //   },
                //   controller: controller.emailController,
                //   keyboardType: TextInputType.text,
                //   hintText: "example@gmail.com",
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return "Password cannot be empty";
                //     }
                //     return null; // Return null if all conditions are met
                //   },
                //   successMessage: "Vaild gmail account",
                //   errorMessage: "Please enter a valid gmail account.",
                //   validateOnInputChange: true,
                // //  showValidationIcons: true,
                // ),
                const Height(height: 50),
                Obx(() {
                  return controller.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : CustomButton(
                          onPressed: () {
                            controller.profileComplete();
                            // Get.to(() => DashboardView());
                          },
                          title: "Sign Up",
                          fontSize: 20,
                          bgColor: !controller.isUserIdEmpty.value ? AppColors.inActive : AppColors.primary,
                          borderColor: !controller.isUserIdEmpty.value ? AppColors.inActive : AppColors.primary,
                          fontWeight: FontWeight.w600,
                          borderRadius: BorderRadius.circular(20),
                        );
                }),
              ],
            ).paddingSymmetric(horizontal: 24),
          ),
        ),
      ),
    );
  }

  Widget chooseImageBottomSheet(CompleteProfileViewController controller, BuildContext context) {
    return Container(
      width: Get.width * 1,
      height: 100,
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Width(
                width: 20,
              ),
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: CustomButton(
                      onPressed: () {
                        controller.selectFile(1);
                      },
                      title: "Camera"),
                ),
              ),
              const Width(
                width: 20,
              ),
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: CustomButton(
                      onPressed: () {
                        controller.selectFile(2);
                      },
                      title: "Gallery"),
                ),
              ),
              const Width(
                width: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
