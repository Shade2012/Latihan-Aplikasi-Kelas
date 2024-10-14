part of 'home_page_bloc.dart';

abstract class HomePageState extends Equatable {
  const HomePageState();

  @override
  List<Object> get props => [];
}

class HomePageInitial extends HomePageState {}

class HomePageLoading extends HomePageState {}

class HomePageLoaded extends HomePageState {
  final List<ScheduleEntity> schedules;

  const HomePageLoaded({required this.schedules});
}

class HomePageEmpty extends HomePageState {}

class HomePageFailure extends HomePageState {
  final Failure failure;
  const HomePageFailure({required this.failure});

  @override
  List<Object> get props => [failure];
}

class DaySelectedState extends HomePageState {
  final int selectedIndex;

  const DaySelectedState(this.selectedIndex);

  @override
  List<Object> get props => [selectedIndex];
}
