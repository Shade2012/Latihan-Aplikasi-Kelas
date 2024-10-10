part of 'login_page_bloc.dart';

abstract class LoginPageState extends Equatable {
  @override
  List<Object?> get props => [];

}

final class LoginPageInitial extends LoginPageState {

}

class LoginPageLoading extends LoginPageState {}

class LoginPageSuccess extends LoginPageState {
final LoginEntities user;

LoginPageSuccess(this.user);

@override
List<Object?> get props => [user];
}

class LoginPageFailure extends LoginPageState {
final String error;

LoginPageFailure(this.error);

@override
List<Object?> get props => [error];
}
