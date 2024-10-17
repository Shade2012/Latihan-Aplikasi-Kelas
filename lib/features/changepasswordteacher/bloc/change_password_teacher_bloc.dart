import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/changepasswordteacher/bloc/change_password_teacher_event.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/changepasswordteacher/bloc/change_password_teacher_state.dart';

class ChangePasswordTeacherBloc extends Bloc<ChangePasswordTeacherEvent,ChangePasswordTeacherState>{
ChangePasswordTeacherBloc() : super(ChangePasswordTeacherInitial()){
  on<LoadChangePasswordTeacher>((event,emit) async{
    emit(ChangePasswordTeacherLoading());
  });
}
}