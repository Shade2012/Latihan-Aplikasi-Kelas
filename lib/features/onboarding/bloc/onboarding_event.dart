import 'package:equatable/equatable.dart';

abstract class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object> get props => [];
}

class NextSlideEvent extends OnboardingEvent {
  final int index;

  NextSlideEvent(this.index);
}

class PreviousSlideEvent extends OnboardingEvent {}

class SkipEvent extends OnboardingEvent {

}
