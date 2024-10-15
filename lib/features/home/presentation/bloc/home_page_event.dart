part of 'home_page_bloc.dart';

abstract class HomePageEvent extends Equatable {
  const HomePageEvent();

  @override
  List<Object> get props => [];
}

class DaySelectEvent extends HomePageEvent {
  final int selectedIndex;

  const DaySelectEvent(this.selectedIndex);

  @override
  List<Object> get props => [selectedIndex];
}

class GetScheduleEvent extends HomePageEvent {}
