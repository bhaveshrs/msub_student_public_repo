import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:msub/common/services/cache_service.dart';
import 'package:msub/common/utils/constants.dart';
import 'package:msub/view/dashboard/dashboard_view.dart';
import '../../../common/utils/image_select.dart';
import '../../../common/utils/status_messages.dart';
import '../models/country_model.dart';
import '../models/programme_model.dart';
import '../models/year_model.dart';
import 'package:http_parser/http_parser.dart';

class CompleteProfileViewController extends GetxController {
  String? selectedProgram;
  String? selectedCountries;
  String? selectedNationality;
  String? selectedYear;
  String? selectedYearId;
  String? selectedGender;
  var dobController = TextEditingController();
  var mobileController = TextEditingController();
  var pRNController = TextEditingController();
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var selectedProgrammer = "".obs;
  var selectedYearDropDown = "".obs;
  var selectedCountry = "".obs;
  var selectedNationalityDropdown = "".obs;
  var isUserIdEmpty = false.obs;

  Rx<File?> file = Rx<File?>(null);
  RxList<Datum> countriesList = <Datum>[].obs;
  RxList<Datum> nationalityList = <Datum>[].obs;
  RxList<ProgramDatum> programmeList = <ProgramDatum>[].obs;
  RxList<YearDatum> yearList = <YearDatum>[].obs;
  Rx<File?> ownImageFile = Rx<File?>(null);
  var token = "";
  var isLoading = false.obs;

  @override
  void onReady() async {
    token = await CacheService.readCache(key: Constants.token);
    await getCountries();
    await getNationality();
    await getProgramme();
    await getYear();
    super.onReady();
  }

  void setGender(String? gender) {
    selectedGender = gender;
    update();
  }

  void setYear(String? gender) {
    selectedYear = gender;
    update();
  }

  Future<void> selectDateOfBirth(BuildContext context) async {
    try {
      DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: dobController.text.isNotEmpty
            ? _parseDateSafe(dobController.text) // Safely parse the date
            : DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      );

      if (selectedDate != null) {
        String formattedDate = "${selectedDate.year.toString().padLeft(4, '0')}/"
            "${selectedDate.month.toString().padLeft(2, '0')}/"
            "${selectedDate.day.toString().padLeft(2, '0')}";

        dobController.text = formattedDate;
        isUserIdEmpty.value = true;
      }
    } catch (e) {
      debugPrint("Error selecting date of birth: $e");
    }
  }

  DateTime _parseDateSafe(String date) {
    try {
      String normalizedDate = date.replaceAll('/', '-');
      return DateTime.parse(normalizedDate);
    } catch (e) {
      debugPrint("Invalid date format: $e. Defaulting to today's date.");
      return DateTime.now();
    }
  }



  void selectFile(int type) async {
    file.value = (type == 1) ? await pickImageCamera() : await pickImageGallery();
    log("file >>> ${file.value}");
    update();
    Get.back();
  }

  Future<List<Datum>> getCountries() async {
    try {
      final Uri url = Uri.parse("${Constants.host}${Constants.getCountries}");
      var headers = {
        "Content-Type": "application/json",
      };
      var body = jsonEncode({
        "token": token,
      });

      var response = await http.post(
        url,
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);

        if (jsonResponse["status"] == 'success') {
          countriesList.value = List<Datum>.from(
            jsonResponse["data"].map((p) => Datum.fromJson(p)),
          );
          for (var country in countriesList) {
            log("Country: ${country.toJson()}");
          }
          return countriesList;
        } else {
          throw Exception(jsonResponse["message"]);
        }
      } else {
        throw Exception("Failed to fetch data. Status code: ${response.statusCode}");
      }
    } catch (e) {
      log("Error during API call: $e");
      rethrow;
    }
  }

  Future<List<Datum>> getNationality() async {
    try {
      final Uri url = Uri.parse("${Constants.host}${Constants.getCountries}");
      var headers = {
        "Content-Type": "application/json",
      };
      var body = jsonEncode({
        "token": token,
      });

      var response = await http.post(
        url,
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);

        if (jsonResponse["status"] == 'success') {
          nationalityList.value = List<Datum>.from(
            jsonResponse["data"].map((p) => Datum.fromJson(p)),
          );
          for (var country in nationalityList) {
            log("Country: ${country.toJson()}");
          }
          return nationalityList;
        } else {
          throw Exception(jsonResponse["message"]);
        }
      } else {
        throw Exception("Failed to fetch data. Status code: ${response.statusCode}");
      }
    } catch (e) {
      log("Error during API call: $e");
      rethrow;
    }
  }

  Future<RxList<ProgramDatum>> getProgramme() async {
    try {
      final Uri url = Uri.parse("${Constants.host}${Constants.getProgrammes}");
      var headers = {
        "Content-Type": "application/json",
      };
      var body = jsonEncode({
        "token": token,
      });

      var response = await http.post(
        url,
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);

        if (jsonResponse["status"] == 'success') {
          programmeList.value = List<ProgramDatum>.from(
            jsonResponse["data"].map((p) => ProgramDatum.fromJson(p)),
          );
          for (var country in programmeList) {
            log("Programmer: ${country.toJson()}");
          }
          return programmeList;
        } else {
          throw Exception(jsonResponse["message"]);
        }
      } else {
        throw Exception("Failed to fetch data. Status code: ${response.statusCode}");
      }
    } catch (e) {
      log("Error during API call: $e");
      rethrow;
    }
  }

  Future<RxList<YearDatum>> getYear() async {
    try {
      final Uri url = Uri.parse("${Constants.host}${Constants.getYears}");

      var headers = {
        "Content-Type": "application/json",
      };
      var body = jsonEncode({
        "token": token,
      });

      var response = await http.post(
        url,
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);

        if (jsonResponse["status"] == 'success') {
          yearList.value = List<YearDatum>.from(
            jsonResponse["data"].map((p) => YearDatum.fromJson(p)),
          );
          for (var country in yearList) {
            log("year: ${country.toJson()}");
          }
          return yearList;
        } else {
          throw Exception(jsonResponse["message"]);
        }
      } else {
        throw Exception("Failed to fetch data. Status code: ${response.statusCode}");
      }
    } catch (e) {
      log("Error during API call: $e");
      rethrow;
    }
  }

/*
  Future<void> profileComplete() async {
    try {
      final Uri url = Uri.parse("${Constants.host}${Constants.studentRegistration}");

      final http.MultipartRequest request = http.MultipartRequest('POST', url);

      String year = selectedYear ?? "2020";
      String gender = selectedGender ?? 'male';
      if (gender != 'male' && gender != 'female') {
        log("Invalid gender selected: $gender. Defaulting to 'male'.");
        gender = 'male';
      }
      request.fields.addAll({
        'token': token,
        'first_name': nameController.text,
        'last_name': 'last name',
        'gender': gender,
        'permanent_address': 'Address',
        'country_id': selectedCountry.value,
        'dob': dobController.text,
        'nationality_id': selectedNationalityDropdown.value,
        'course_id': selectedProgrammer.value,
        'year': year,
      });
      log("Sending fields:");
      request.fields.forEach((key, value) {
        log("$key: $value");
      });

      if (file.value != null && file.value!.path.isNotEmpty) {
        String fileName = file.value!.path.split('/').last;
        String fileType = fileName.split('.').last;

        if (['jpg', 'jpeg', 'png'].contains(fileType.toLowerCase())) {
          request.files.add(await http.MultipartFile.fromPath(
            'image',
            file.value!.path,
            filename: fileName,
            contentType: MediaType('image', fileType.toLowerCase()),
          ));
          log("File being sent: $fileName of type $fileType");
        } else {
          log('Unsupported file type: $fileType');
          return;
        }
      } else {
        log("No image file selected");
      }
      final http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        final http.Response responseData = await http.Response.fromStream(response);
        var jsonResponse = json.decode(responseData.body);
        log("Response body: ${responseData.body}");
        if (jsonResponse['status'] == 'success') {
          showSuccessMessage(jsonResponse['message'] ?? 'Profile completed successfully');
          Get.offAll(()=>DashboardView());
          log("Response: ${jsonResponse['message']}");
        } else {
          showErrorMessage(jsonResponse['message'] ?? 'Failed to complete profile');
          log("Error: ${jsonResponse['message']}");
        }
      } else if (response.statusCode == 422) {
        final http.Response responseData = await http.Response.fromStream(response);
        var jsonResponse = json.decode(responseData.body);
        String errorMessage = jsonResponse['message'] ?? 'Validation error occurred';

        if (jsonResponse['errors'] != null) {
          var errors = jsonResponse['errors'];
          errorMessage = errors.values.join(", ");
        }
        showErrorMessage(errorMessage);
        log("422 Error: $errorMessage");
      } else {
        showErrorMessage("Server error: ${response.statusCode}");
        log("Server error: ${response.statusCode}");
      }
    } catch (e) {
      log("Error during profile completion: $e");
      showErrorMessage("An error occurred: $e");
    }
  }
*/
  Future<void> profileComplete() async {
    try {
      isLoading.value = true;

      final Uri url = Uri.parse("${Constants.host}${Constants.studentRegistration}");
      final http.MultipartRequest request = http.MultipartRequest('POST', url);

      String year = selectedYear ?? "2020";
      String gender = selectedGender ?? 'male';
      if (gender != 'male' && gender != 'female' && gender != 'other') {
        log("Invalid gender selected: $gender. Defaulting to 'male'.");
        gender = 'male';
      }

      request.fields.addAll({
        'token': token,
        'name': nameController.text,
        'gender': gender,
        'permanent_address': 'Address',
        'country_id': selectedCountry.value,
        'dob': dobController.text,
        'nationality_id': selectedNationalityDropdown.value,
        'course_id': selectedProgrammer.value,
        'year': year,
      });

      log("Sending fields:");
      request.fields.forEach((key, value) {
        log("$key: $value");
      });

      // Handle file upload if image is selected
      if (file.value != null && file.value!.path.isNotEmpty) {
        String fileName = file.value!.path.split('/').last;
        String fileType = fileName.split('.').last;

        if (['jpg', 'jpeg', 'png'].contains(fileType.toLowerCase())) {
          request.files.add(await http.MultipartFile.fromPath(
            'image',
            file.value!.path,
            filename: fileName,
            contentType: MediaType('image', fileType.toLowerCase()),
          ));
          log("File being sent: $fileName of type $fileType");
        } else {
          log('Unsupported file type: $fileType');
          isLoading.value = false;
          return;
        }
      } else {
        log("No image file selected");
      }

      // Send the request
      final http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        isLoading.value = false;
        final http.Response responseData = await http.Response.fromStream(response);
        var jsonResponse = json.decode(responseData.body);
        log("Response body: ${responseData.body}");
        if (jsonResponse['status'] == 'success') {
          showSuccessMessage(jsonResponse['message'] ?? 'Profile completed successfully');
          Get.offAll(() => DashboardView());
          log("Response: ${jsonResponse['message']}");
        } else {
          showErrorMessage(jsonResponse['message'] ?? 'Failed to complete profile');
          log("Error: ${jsonResponse['message']}");
        }
      } else if (response.statusCode == 422) {
        final http.Response responseData = await http.Response.fromStream(response);
        var jsonResponse = json.decode(responseData.body);
        String errorMessage = jsonResponse['message'] ?? 'Validation error occurred';

        if (jsonResponse['errors'] != null) {
          var errors = jsonResponse['errors'];
          errorMessage = errors.values.join(", ");
        }
        showErrorMessage(errorMessage);
        log("422 Error: $errorMessage");
      } else {
        showErrorMessage("Server error: ${response.statusCode}");
        log("Server error: ${response.statusCode}");
      }
    } catch (e) {
      log("Error during profile completion: $e");
      showErrorMessage("An error occurred: $e");
    } finally {
      isLoading.value = false;
    }
  }

}
