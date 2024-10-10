part of 'login_page_bloc.dart';

abstract class LoginPageEvent extends Equatable {
  @override
  List<Object?> get props => [];
  const LoginPageEvent();
}

class LoginButtonPressed extends LoginPageEvent {
  final String email;
  final String password;

  LoginButtonPressed({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
