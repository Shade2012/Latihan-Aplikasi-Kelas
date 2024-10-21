import 'package:equatable/equatable.dart';

abstract class ChangePasswordEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ChangePasswordRequested extends ChangePasswordEvent {
  final String oldPassword;
  final String newPassword;
  final String confirmPassword;
  final String token;

  ChangePasswordRequested({
    required this.oldPassword,
    required this.newPassword,
    required this.confirmPassword,
    required this.token,
  });

  @override
  List<Object> get props => [oldPassword, newPassword, confirmPassword, token];
}
