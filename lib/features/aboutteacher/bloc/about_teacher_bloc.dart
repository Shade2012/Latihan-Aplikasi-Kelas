import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/aboutteacher/bloc/about_teacher_event.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/aboutteacher/bloc/about_teacher_state.dart';

class AboutTeacherBloc extends Bloc<AboutTeacherEvent,AboutTeacherState>{
  AboutTeacherBloc() : super(AboutTeacherInitial()){
    on<LoadAboutTeacher>((event,emit) async{
      emit(AboutTeacherLoading());
    });
  }
}