import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/error/failure.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/forgotpassword/domain/entities/forgot_password_entities.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/forgotpassword/domain/usecases/forgot_password_reset_password.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/forgotpassword/domain/usecases/forgot_password_sendotp.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/forgotpassword/domain/usecases/forgot_password_verifyotp.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final ForgotPasswordSendOtp;
  final ForgotPasswordVerifyOtp;
  final ForgotPasswordResetPassword;
  ForgotPasswordBloc({required this.ForgotPasswordSendOtp,required this.ForgotPasswordVerifyOtp,required this.ForgotPasswordResetPassword}) : super(ForgotPasswordInitial()) {

    on<ForgotPasswordSendOtpEvent>((event, emit) async {
        emit(ForgotPasswordLoading());
        Either<Failure,ForgotPasswordEntities> result = await ForgotPasswordSendOtp.execute(event.email);
        result.fold((failure) {
          emit(ForgotPasswordFailure(error: failure.message));
        }, (result) async {
          emit(ForgotPasswordSuccess(result));
        },);
    },);

    on<ForgotPasswordResendOtpEmail>((event, emit) async {
        Either<Failure,ForgotPasswordEntities> result = await ForgotPasswordSendOtp.execute(event.email);
        result.fold((failure) {
          emit(ForgotPasswordFailure(error: failure.message));
        }, (result) async {
          emit(ForgotPasswordSuccessSendOtp());
        },);
    },);

    on<ForgotPasswordVerifyOtpEvent>((event, emit) async {
      emit(ForgotPasswordLoading());
      Either<Failure,ForgotPasswordEntities> result = await ForgotPasswordVerifyOtp.execute(event.otp);
      result.fold((failure) {
        emit(ForgotPasswordFailure(error: failure.message));
      }, (result) {
        emit(ForgotPasswordSuccess(result));
      },);
    },);

    on<ForgotPasswordLastPageEvent>((event, emit) async {
      emit(ForgotPasswordLoading());
      if(event.password == event.confirmPassword){
        Either<Failure,ForgotPasswordEntities> result = await ForgotPasswordResetPassword.execute(event.password,event.confirmPassword);
        result.fold((failure) {
          emit(ForgotPasswordFailure(error: failure.message));
        }, (result) {
          emit(ForgotPasswordSuccess(result));
        },);
        return;
      }else{
        emit(ForgotPasswordFailure(error: 'Password Tidak Sama'));
      }
    });
  }
}
