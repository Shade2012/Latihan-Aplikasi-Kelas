import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/change_password_student/domain/usecases/change_password_update.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/change_password_student/presentation/bloc/change_password_event.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/change_password_student/presentation/bloc/change_password_state.dart';

class ChangePasswordBloc extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  final ChangePasswordUseCase changePasswordUseCase;

  ChangePasswordBloc(this.changePasswordUseCase) : super(ChangePasswordInitial()) {
    on<ChangePasswordRequested>((event, emit) async {
      emit(ChangePasswordLoading());
      try {
        // Verify old password
        bool isOldPasswordValid = await changePasswordUseCase.verifyOldPassword(event.oldPassword, event.token);

        if (!isOldPasswordValid) {
          emit(ChangePasswordFailure('Password Lama tidak valid.'));
          return;
        }

        // Proceed to change password
        await changePasswordUseCase.execute(
          event.oldPassword,
          event.newPassword,
          event.confirmPassword,
          event.token,
        );
        emit(ChangePasswordSuccess());
      } catch (error) {
        emit(ChangePasswordFailure(error.toString()));
      }
    });
  }
}
