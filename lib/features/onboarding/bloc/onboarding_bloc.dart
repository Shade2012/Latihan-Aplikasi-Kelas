import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/onboarding/bloc/onboarding_event.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/onboarding/bloc/onboarding_state.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/onboarding/models/onboarding_models.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(const OnboardingState(currentIndex: 0)) {
    on<NextSlideEvent>((event, emit) {
      emit(state.copyWith(currentIndex: event.index));
    });

    on<PreviousSlideEvent>((event, emit) {
      if (state.currentIndex > 0) {
        emit(state.copyWith(currentIndex: state.currentIndex - 1));
      }
    });

    on<SkipEvent>((event, emit) {
      emit(state.copyWith(currentIndex: onboardingSlides.length - 1));
    });
  }
}
