part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();
}

final class ForgotPasswordInitial extends ForgotPasswordState {
  @override
  List<Object> get props => [];
}
