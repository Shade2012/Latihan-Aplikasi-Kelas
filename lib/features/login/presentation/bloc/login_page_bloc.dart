import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/login_entities.dart';

part 'login_page_event.dart';
part 'login_page_state.dart';

class LoginPageBloc extends Bloc<LoginPageEvent, LoginPageState> {
  final Login;
  LoginPageBloc({required this.Login}) : super(LoginPageInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginPageLoading());
      Either<Failure, LoginEntities> result =
          await Login.execute(event.email, event.password);
      result.fold((failure) {
        emit(LoginPageFailure(failure.message));
      }, (user) {
        print("Login succeeded: ${user.success}");
        emit(LoginPageSuccess(user));
      });
    });
  }
}
