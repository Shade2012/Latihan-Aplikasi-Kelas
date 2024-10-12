part of 'home_page_bloc.dart';

abstract class HomePageState extends Equatable {
  const HomePageState();

  @override
  List<Object> get props => [];
}

class HomePageInitial extends HomePageState {}

class HomePageLoading extends HomePageState {}

class DaySelectedState extends HomePageState {
  final int selectedIndex;

  const DaySelectedState(this.selectedIndex);

  @override
  List<Object> get props => [selectedIndex];
}
