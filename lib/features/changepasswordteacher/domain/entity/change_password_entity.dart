class ChangePasswordTeacherEntity {
  final String oldPassword;
  final String newPassword;
  final String passwordConfirmation;

  ChangePasswordTeacherEntity({
    required this.oldPassword,
    required this.newPassword,
    required this.passwordConfirmation,
  });
}
