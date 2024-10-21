part of 'home_page_bloc.dart';

abstract class HomePageState extends Equatable {
  const HomePageState();

  @override
  List<Object> get props => [];
}

class HomePageInitial extends HomePageState {}

class HomePageLoading extends HomePageState {}

class HomePageLoaded extends HomePageState {
  final int selectedIndex;
  final UserEntity profile;
  final List<ScheduleEntity> schedules;

  const HomePageLoaded(this.selectedIndex,
      {required this.schedules, required this.profile});

  @override
  List<Object> get props => [selectedIndex, schedules, profile];
}

class HomePageEmpty extends HomePageState {}

class HomePageFailure extends HomePageState {
  final Failure failure;
  const HomePageFailure({required this.failure});

  @override
  List<Object> get props => [failure];
}
