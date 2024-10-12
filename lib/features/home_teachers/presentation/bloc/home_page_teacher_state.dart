part of 'home_page_teacher_bloc.dart';

abstract class HomePageTeacherState extends Equatable {
  const HomePageTeacherState();
  @override
  List<Object?> get props => [];
}

final class HomePageTeacherInitial extends HomePageTeacherState {}
final class HomePageTeacherLoading extends HomePageTeacherState {}

final class HomePageTeacherSelectedDay extends HomePageTeacherState{
 int tabIndex;
HomePageTeacherSelectedDay({required this.tabIndex});
@override
List<Object?> get props => [tabIndex];
}

final class HomePageTeacherLoad extends HomePageTeacherState {
  int tabIndex;
  final List<DaySchedule> daySchedules;
  HomePageTeacherLoad({required this.daySchedules,required this.tabIndex});
  @override
  List<Object?> get props => [daySchedules,tabIndex];
}
final class HomePageTeacherFailure extends HomePageTeacherState {
final Failure failure;
HomePageTeacherFailure({required this.failure});
@override
List<Object?> get props => [failure];
}

