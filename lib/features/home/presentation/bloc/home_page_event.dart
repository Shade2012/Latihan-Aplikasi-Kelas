part of 'home_page_bloc.dart';

abstract class HomePageEvent extends Equatable {
  const HomePageEvent();

  @override
  List<Object> get props => [];
}

class GetScheduleEvent extends HomePageEvent {
  final int selectedIndex;

  const GetScheduleEvent(this.selectedIndex);

  @override
  List<Object> get props => [selectedIndex];
}
