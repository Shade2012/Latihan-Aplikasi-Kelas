part of 'home_page_bloc.dart';

abstract class HomePageEvent extends Equatable {}

abstract class TabEvent extends Equatable {
  const TabEvent();
}

class TabChanged extends TabEvent {
  final int index;

  const TabChanged(this.index);

  @override
  List<Object> get props => [index];
}
