import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/changepasswordteacher/domain/usecases/change_password_teacher_update.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/changepasswordteacher/presentation/bloc/change_password_teacher_event.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/changepasswordteacher/presentation/bloc/change_password_teacher_state.dart';

class ChangePasswordTeacherBloc extends Bloc<ChangePasswordTeacherEvent, ChangePasswordTeacherState> {
  final ChangePasswordTeacherUseCase changePasswordTeacherUseCase;

  ChangePasswordTeacherBloc(this.changePasswordTeacherUseCase) : super(ChangePasswordTeacherInitial()) {
    on<ChangePasswordTeacherRequested>((event, emit) async {
      emit(ChangePasswordTeacherLoading());
      try {
        // Verify old password
        bool isOldPasswordValid = await changePasswordTeacherUseCase.verifyOldPasswordTeacher(event.oldPassword, event.token);

        if (!isOldPasswordValid) {
          emit(ChangePasswordTeacherFailure('Password Lama tidak valid.'));
          return;
        }

        // Proceed to change password
        await changePasswordTeacherUseCase.execute(
          event.oldPassword,
          event.newPassword,
          event.confirmPassword,
          event.token,
        );
        emit(ChangePasswordTeacherSuccess());
      } catch (error) {
        emit(ChangePasswordTeacherFailure(error.toString()));
      }
    });
  }
}
