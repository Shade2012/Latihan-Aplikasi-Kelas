part of 'home_page_teacher_bloc.dart';

abstract class HomePageTeacherEvent extends Equatable {
  String? name;
  String? image;
  HomePageTeacherEvent({this.name,this.image});
}

class AllScheduleEvent extends HomePageTeacherEvent{
  int? selectedIndex;
  int? selectedKelasIndex;
  int? selectedMataPelajaranIndex;
  String? hari;
  String? kelas;
  String? pelajaran;
  AllScheduleEvent({ this.selectedIndex, this.hari,this.kelas,this.pelajaran,this.selectedKelasIndex,this.selectedMataPelajaranIndex});
  @override
  // TODO: implement props
  List<Object?> get props => [selectedIndex,hari,kelas,pelajaran,selectedKelasIndex,selectedMataPelajaranIndex];
}
class OnSelectedDays extends HomePageTeacherEvent{
   int selectedIndex;
    OnSelectedDays({required this.selectedIndex});
  @override
  // TODO: implement props
  List<Object?> get props => [selectedIndex];
}
