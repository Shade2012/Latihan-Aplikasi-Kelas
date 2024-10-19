class ChangePasswordModel {
  final String oldPassword;
  final String newPassword;
  final String confirmPassword;

  ChangePasswordModel({
    required this.oldPassword,
    required this.newPassword,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'old_password': oldPassword,
      'password': newPassword,
      'password_confirmation': confirmPassword,
    };
  }
}
