class ApisEndPoints {
  static const String baseUrl = 'https://myfaculy-msub.in/api/v1';
  static const String emailOtp = '/send_login_emailotp';
  static const String forgetPasswordOtp = '/send_forgetpassword_otp';
  static const String verifyForgetPasswordOtp = '/verify_forgetpassword_otp';
  static const String resetPass = '/reset_forgetpassword_otp';
  static const String verifyOtp = '/verify_login_otp';
  static const String userLogin = '/user_login';
  static const String notificationListing = '/all_notification_list';
  // static const String notificationListing = '/teacher_notification_list';
  static const String updateUserName = "/update_user_name";
  static const String getUser = "/get_user";
  static const String sendEmailOtp = "/send_email_otp";
  static const String verifyEmailOtp = "/verify_email_otp";
  static const String sendMobileOtp = "/send_mobile_otp";
  static const String verifyMobileOtp = "/verify_mobile_otp";
  static const String setPassword = "/set_password";

  /// Profile API
  static const String getCountries = "/get_countries";
  static const String getProgrammes = "/get_programmes";
  static const String getYears = "/get_years";
  static const String getStudentDetails = "/get_student_details";
  static const String logOut = "/logout";
  static const String studentRegistration = "/student_registration";
}
