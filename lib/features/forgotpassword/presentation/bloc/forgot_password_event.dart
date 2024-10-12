part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordEvent extends Equatable {
  @override
  List<Object?> get props => [];
  const ForgotPasswordEvent();
}
class ForgotPasswordLastPageEvent extends ForgotPasswordEvent{
  String password;
  String confirmPassword;

  ForgotPasswordLastPageEvent({required this.password,required this.confirmPassword});
  @override
  List<Object?> get props => [password, confirmPassword];


}
