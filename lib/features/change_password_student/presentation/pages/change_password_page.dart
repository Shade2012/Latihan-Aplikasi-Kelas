import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/error/snackbar_error.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/success/snackbar_success.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/themes/colors.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/change_password_student/data/datasources/change_password_remote_data_source_impl.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/change_password_student/data/repository/change_password_repository_impl.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/change_password_student/domain/usecases/change_password_update.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/change_password_student/presentation/bloc/change_password_bloc.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/change_password_student/presentation/bloc/change_password_state.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/change_password_student/presentation/widget/change_password_form_widget.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/network/dio_instance.dart';

class ChangePasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dioInstance = DioInstance();
    final remoteDataSource = ChangePasswordRemoteDataSourceImpl(dioInstance: dioInstance);
    final repository = ChangePasswordRepositoryImpl(remoteDataSource);
    final useCase = ChangePasswordUseCase(repository);

    return BlocProvider(
      create: (context) => ChangePasswordBloc(useCase),
      child: Scaffold(
        body: BlocConsumer<ChangePasswordBloc, ChangePasswordState>(
          listener: (context, state) {
            if (state is ChangePasswordSuccess) {
              SnackbarSuccess.showSuccess(context, 'Password Berhasil Diubah');
              context.pushNamed('navbar');
            } else if (state is ChangePasswordFailure) {
              String errorMessage = state.message.isNotEmpty
                  ? state.message
                  : 'Gagal Update Password. Coba Lagi.';
              SnackBarError.showError(context, errorMessage);
            }
          },
          builder: (context, state) {
            if (state is ChangePasswordLoading) {
              return Center(child: CircularProgressIndicator());
            }

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ChangePasswordFormWidget(),
            );
          },
        ),
      ),
    );
  }
}
