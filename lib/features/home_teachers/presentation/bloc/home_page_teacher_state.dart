part of 'home_page_teacher_bloc.dart';

abstract class HomePageTeacherState extends Equatable {

  const HomePageTeacherState();
  @override
  List<Object?> get props => [];
}

final class HomePageTeacherInitial extends HomePageTeacherState {}
final class HomePageTeacherEmpty extends HomePageTeacherState {}
final class HomePageTeacherLoading extends HomePageTeacherState {}

final class HomePageTeacherSelectedDay extends HomePageTeacherState{
 int tabIndex;
HomePageTeacherSelectedDay({required this.tabIndex});
@override
List<Object?> get props => [tabIndex];
}

final class HomePageTeacherLoad extends HomePageTeacherState {
  String name;
  String? image;
  int tabIndex;
  final List<KelasEntities> kelasEntities;
  final List<PelajaranEntities> pelajaranEntities;
  final DaySchedule daySchedules;
  HomePageTeacherLoad({required this.name, this.image,required this.daySchedules,required this.tabIndex,required this.kelasEntities, required this.pelajaranEntities});
  @override
  List<Object?> get props => [daySchedules,tabIndex,kelasEntities,pelajaranEntities,name,image];
}
final class HomePageTeacherFailure extends HomePageTeacherState {
final Failure failure;
HomePageTeacherFailure({required this.failure});
@override
List<Object?> get props => [failure];
}

