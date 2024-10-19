import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/change_password_confirm_student/bloc/change_password_confirm_student_event.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/change_password_confirm_student/bloc/change_password_confirm_student_state.dart';

class ChangePasswordConfirmStudentBloc extends Bloc<
    ChangePasswordConfirmStudentEvent, ChangePasswordConfirmStudentState> {
  ChangePasswordConfirmStudentBloc()
      : super(ChangePasswordConfirmStudentInitial()) {
    on<LoadChangePasswordConfirmStudent>((event, emit) async {
      emit(ChangePasswordConfirmStudentLoading());
    });
  }
}
