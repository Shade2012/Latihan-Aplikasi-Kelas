import 'package:equatable/equatable.dart';

class OnboardingState extends Equatable {
  final int currentIndex;

  const OnboardingState({required this.currentIndex});

  OnboardingState copyWith({int? currentIndex}) {
    return OnboardingState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }

  @override
  List<Object?> get props => [currentIndex];
}
