part of 'google_button_bloc.dart';

abstract class GoogleButtonEvent extends Equatable {
  @override
  List<Object?> get props => [];
  const GoogleButtonEvent();
}

class GoogleButtonPressed extends GoogleButtonEvent{}
