import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/error/failure.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/login/domain/usecases/google_login.dart';

import '../../../../domain/entities/google_login_entities.dart';

part 'google_button_event.dart';
part 'google_button_state.dart';

class GoogleButtonBloc extends Bloc<GoogleButtonEvent, GoogleButtonState> {
  final GoogleLogin;
  GoogleButtonBloc({required this.GoogleLogin}) : super(GoogleButtonInitial()) {
    on<GoogleButtonEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GoogleButtonPressed>((event, emit) async {
      emit(GoogleButtonLoading());
      Either<Failure,GoogleLoginEntities> result = await GoogleLogin.execute();
      result.fold((failure) {
        emit(GoogleButtonError('Failed to login'));
      },(result) {
        emit(GoogleButtonSuccess(googleButtonEntities: result));
      },);
    },);
  }
}
