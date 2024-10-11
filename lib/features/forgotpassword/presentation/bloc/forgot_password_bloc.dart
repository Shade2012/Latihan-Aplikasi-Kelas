import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(ForgotPasswordInitial()) {
    on<ForgotPasswordLastPageEvent>((event, emit) {
      if(event.password == event.confirmPassword){
        emit(ForgotPasswordSuccess());
      }else{
        emit(ForgotPasswordFailure(error: 'Password Tidak Sama'));
      }
    });
  }
}
