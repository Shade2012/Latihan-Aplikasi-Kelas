part of 'splash_screen_bloc.dart';

abstract class SplashScreenState extends Equatable {
  @override
  List<Object> get props => [];
}

final class SplashScreenInitial extends SplashScreenState {}

class SplashNavigateToLogin extends SplashScreenState {}

class SplashNavigateToHome extends SplashScreenState {}
class SplashNavigateToHomeTeacher extends SplashScreenState {}
