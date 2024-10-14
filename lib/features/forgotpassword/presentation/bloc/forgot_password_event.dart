part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordEvent extends Equatable {
  @override
  List<Object?> get props => [];
  const ForgotPasswordEvent();
}
class ForgotPasswordSendOtpEvent extends ForgotPasswordEvent{
  String email;
  ForgotPasswordSendOtpEvent({required this.email});
  @override
  List<Object?> get props => [email];
}
class ForgotPasswordResendOtpEmail extends ForgotPasswordEvent{
  String email;
  ForgotPasswordResendOtpEmail({required this.email});
  @override
  List<Object?> get props => [email];
}
class ForgotPasswordVerifyOtpEvent extends ForgotPasswordEvent{
  String otp;

  ForgotPasswordVerifyOtpEvent({required this.otp});
  @override
  List<Object?> get props => [otp];


}
class ForgotPasswordLastPageEvent extends ForgotPasswordEvent{
  String password;
  String confirmPassword;

  ForgotPasswordLastPageEvent({required this.password,required this.confirmPassword});
  @override
  List<Object?> get props => [password, confirmPassword];


}
