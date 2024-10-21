import 'package:equatable/equatable.dart';

abstract class AboutTeacherState extends Equatable {
  const AboutTeacherState();

  @override
  List<Object> get props => [];
}

class AboutTeacherInitial extends AboutTeacherState {}

class LoadAboutTeacher extends AboutTeacherState {
  final String page;

  const LoadAboutTeacher({required this.page});

  @override
  List<Object> get props => [page];
}
