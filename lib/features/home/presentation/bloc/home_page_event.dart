part of 'home_page_bloc.dart';

abstract class HomePageEvent extends Equatable {
  const HomePageEvent();

  @override
  List<Object> get props => [];
}

class GetHomeDataEvent extends HomePageEvent {
  final int selectedIndex;

  const GetHomeDataEvent(this.selectedIndex);

  @override
  List<Object> get props => [selectedIndex];
}
