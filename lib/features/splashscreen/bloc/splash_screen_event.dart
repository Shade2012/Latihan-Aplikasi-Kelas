part of 'splash_screen_bloc.dart';

abstract class SplashScreenEvent extends Equatable {
  @override
  List<Object> get props => [];
}
class SplashScreenStarted extends SplashScreenEvent {}
