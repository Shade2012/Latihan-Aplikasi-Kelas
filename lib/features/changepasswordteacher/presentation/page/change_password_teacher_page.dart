import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/error/snackbar_error.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/success/snackbar_success.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/network/dio_instance.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/changepasswordteacher/data/repository/change_password_teacher_repository_impl.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/changepasswordteacher/domain/usecases/change_password_teacher_update.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/changepasswordteacher/presentation/bloc/change_password_teacher_bloc.dart';

import '../../data/datasources/change_password_teacher_data_source_impl.dart';
import '../bloc/change_password_teacher_state.dart';
import '../widget/change_password_teacher_form_widget.dart';

class ChangePasswordTeacherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dioInstance = DioInstance();
    final remoteDataSource = ChangePasswordTeacherDataSourceImpl(dioInstance: dioInstance);
    final repository = ChangePasswordTeacherRepositoryImpl(remoteDataSource);
    final useCase = ChangePasswordTeacherUseCase(repository);

    return BlocProvider(
      create: (context) => ChangePasswordTeacherBloc(useCase),
      child: Scaffold(
        body: BlocConsumer<ChangePasswordTeacherBloc, ChangePasswordTeacherState>(
          listener: (context, state) {
            if (state is ChangePasswordTeacherSuccess) {
              SnackbarSuccess.showSuccess(context, 'Password Berhasil Diubah');
              context.pushNamed('change_password_confirm_teacher_page');
            } else if (state is ChangePasswordTeacherFailure) {
              String errorMessage = state.message.isNotEmpty
                  ? state.message
                  : 'Gagal Update Password. Coba Lagi.';
              SnackBarError.showError(context, errorMessage);
            }
          },
          builder: (context, state) {
            if (state is ChangePasswordTeacherLoading) {
              return Center(child: CircularProgressIndicator());
            }

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ChangePasswordTeacherFormWidget(),
            );
          },
        ),
      ),
    );
  }
}
