import 'package:equatable/equatable.dart';

abstract class ChangePasswordTeacherState extends Equatable {
  @override
  List<Object> get props => [];
}

class ChangePasswordTeacherInitial extends ChangePasswordTeacherState {}

class ChangePasswordTeacherLoading extends ChangePasswordTeacherState {}

class ChangePasswordTeacherSuccess extends ChangePasswordTeacherState {}

class ChangePasswordTeacherFailure extends ChangePasswordTeacherState {
  final String message;

  ChangePasswordTeacherFailure(this.message);

  @override
  List<Object> get props => [message];
}
