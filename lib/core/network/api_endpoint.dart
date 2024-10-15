class ApiEndPoint {
  static String baseUrl = 'https://c7d2-36-72-216-36.ngrok-free.app';

  //Auth
  static String baseUrlDetailUser = '$baseUrl/users/details';
  static String baseUrlAllUser = '$baseUrl/users/all-users';
  static String baseUrlRegister = '$baseUrl/users/register';
  static String baseUrlLogin = '$baseUrl/api/login';
  static String baseUrlLoginGoogle = '$baseUrl/api/login/google';
  static String baseUrlForgotSendOtp = '$baseUrl/api/send-otp';
  static String baseUrlForgotVerifiedOtp = '$baseUrl/api/verify-otp';
  static String baseUrlForgotPasswordConfirm = '$baseUrl/api/reset-password';
  static String baseUrlUserSchedule = '$baseUrl/api/jadwal/siswa';
}
