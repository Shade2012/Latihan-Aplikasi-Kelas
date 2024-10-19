import 'package:equatable/equatable.dart';

abstract class ChangePasswordTeacherEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ChangePasswordTeacherRequested extends ChangePasswordTeacherEvent {
  final String oldPassword;
  final String newPassword;
  final String confirmPassword;
  final String token;

  ChangePasswordTeacherRequested({
    required this.oldPassword,
    required this.newPassword,
    required this.confirmPassword,
    required this.token,
  });

  @override
  List<Object> get props => [oldPassword, newPassword, confirmPassword, token];
}
