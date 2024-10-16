import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'splash_screen_event.dart';
part 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc() : super(SplashScreenInitial()) {
    on<SplashScreenEvent>(_checkAuthentication);
  }

  Future<void> _checkAuthentication(
    SplashScreenEvent event,
    Emitter<SplashScreenState> emit,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final role = prefs.getString('role');

    if (token != null && token.isNotEmpty) {
      if (role == 'guru') {
        emit(SplashNavigateToHomeTeacher());
      } else if (role == 'siswa') {
        emit(SplashNavigateToHome());
      } else {
        emit(SplashNavigateToOnBoarding());
      }
    } else {
      emit(SplashNavigateToLogin());
    }
  }
}
