import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'splash_screen_event.dart';
part 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc() : super(SplashScreenInitial()) {
    on<SplashScreenEvent>((event, emit) async {
      await Future.delayed(Duration(seconds: 2));
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      if(token != null){
        emit(SplashNavigateToHome());
      }else{
        emit(SplashNavigateToLogin());
      }
    });
  }
}
