part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordState extends Equatable {
  @override
  List<Object?> get props => [];
  const ForgotPasswordState();
}

final class ForgotPasswordInitial extends ForgotPasswordState {}

final class ForgotPasswordSuccess extends ForgotPasswordState {
final ForgotPasswordEntities user;
  ForgotPasswordSuccess(this.user);
  @override
  List<Object?> get props => [user];
}

final class ForgotPasswordSuccessSendOtp extends ForgotPasswordState {}

final class ForgotPasswordLoading extends ForgotPasswordState {}
final class ForgotPasswordSecondPage extends ForgotPasswordState {}
final class ForgotPasswordThirdPage extends ForgotPasswordState {}
final class ForgotPasswordToLogin extends ForgotPasswordState {}

final class ForgotPasswordFailure extends ForgotPasswordState{
  String error;
  ForgotPasswordFailure({required this.error});
    @override
    List<Object?> get props => [error];

}
