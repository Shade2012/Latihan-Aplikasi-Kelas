part of 'home_page_teacher_bloc.dart';

abstract class HomePageTeacherEvent extends Equatable {
  const HomePageTeacherEvent();
}

class AllScheduleEvent extends HomePageTeacherEvent{
  int selectedIndex;
  AllScheduleEvent({required this.selectedIndex});
  @override
  // TODO: implement props
  List<Object?> get props => [selectedIndex];
}
class OnSelectedDays extends HomePageTeacherEvent{
   int selectedIndex;
    OnSelectedDays({required this.selectedIndex});
  @override
  // TODO: implement props
  List<Object?> get props => [selectedIndex];
}
