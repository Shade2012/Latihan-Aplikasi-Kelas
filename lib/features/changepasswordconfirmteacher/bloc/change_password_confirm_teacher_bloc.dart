import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/changepasswordconfirmteacher/bloc/change_password_confirm_teacher_event.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/changepasswordconfirmteacher/bloc/change_password_confirm_teacher_state.dart';

class ChangePasswordConfirmTeacherBloc extends Bloc<
    ChangePasswordConfirmTeacherEvent, ChangePasswordConfirmTeacherState> {
  ChangePasswordConfirmTeacherBloc()
      : super(ChangePasswordConfirmTeacherInitial()) {
    on<LoadChangePasswrodConfirmTeacher>((event, emit) async {
      emit(ChangePasswordConfirmTeachetLoading());
    });
  }
}
