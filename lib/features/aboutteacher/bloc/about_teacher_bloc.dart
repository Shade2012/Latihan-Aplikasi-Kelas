import 'package:flutter_bloc/flutter_bloc.dart';
import 'about_teacher_event.dart';
import 'about_teacher_state.dart';

class AboutTeacherBloc extends Bloc<AboutTeacherEvent, AboutTeacherState> {
  AboutTeacherBloc() : super(AboutTeacherInitial()) {
    on<LoadAboutTeacherEvent>((event, emit) {
      emit(LoadAboutTeacher(page: 'About Teacher Page'));
    });
  }
}
