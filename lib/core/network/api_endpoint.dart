class ApiEndPoint {
  static String baseUrl = 'https://b8ca-114-10-151-171.ngrok-free.app';

  //Auth
  static String baseUrlDetailUser = '$baseUrl/users/details';
  static String baseUrlAllUser = '$baseUrl/users/all-users';
  static String baseUrlRegister = '$baseUrl/users/register';
  static String baseUrlLogin = '$baseUrl/api/login';
  static String baseUrlLoginGoogle = '$baseUrl/api/login/google';
  static String baseUrlForgotSendOtp = '$baseUrl/api/send-otp';
  static String baseUrlForgotVerifiedOtp = '$baseUrl/api/verify-otp';
  static String baseUrlForgotPasswordConfirm = '$baseUrl/api/reset-password';
  static String baseUrlScheduleDay = '$baseUrl/api/jadwal/filter';
  static String baseUrlAllPelajaran = '$baseUrl/api/pelajaran/guru';
  static String baseUrlAllKelas = '$baseUrl/api/kelas';
  static String baseUrlUserSchedule = '$baseUrl/api/jadwal/siswa';
  static String baseUrlUserNotification = '$baseUrl/api/notification';
<<<<<<< HEAD
  static String baseUrlTeacherProfile = '$baseUrl/api/user/detail';
=======
  static String baseUrlUserChangePassword = '$baseUrl/api/user/update';
>>>>>>> 85053a6d4b8f5cd7b7b90597f3ddc4905f8dd978
}
