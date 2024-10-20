import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'splash_screen_event.dart';
part 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc() : super(SplashScreenInitial()) {
    on<SplashScreenEvent>(_checkAuthentication);
  }

  Future _checkAuthentication(
    SplashScreenEvent event,
    Emitter<SplashScreenState> emit,
  ) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final role = prefs.getString('role');

    if (token != null && token.isNotEmpty) {
      switch (role) {
        case 'guru':
          emit(SplashNavigateToHomeTeacher());
          break;
        case 'siswa':
          emit(SplashNavigateToHome());
          break;
        default:
          emit(SplashNavigateToOnBoarding());
          break;
      }
    }else{
      emit(SplashNavigateToOnBoarding());
    }

  }
}
