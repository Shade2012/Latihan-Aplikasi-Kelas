import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_profile.dart';
import '../../domain/entities/schedule_entities.dart';
import '../../domain/entities/user_entities.dart';
import '../../domain/usecases/get_schedule.dart';

import '../../../../core/error/failure.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc({
    required GetScheduleUseCase getScheduleUseCase,
    required GetHomeProfileUseCase getProfileUseCase,
  })  : _getScheduleUseCase = getScheduleUseCase,
        _getProfileUseCase = getProfileUseCase,
        super(HomePageInitial()) {
    on<GetProfileEvent>(_getProfileData);
    on<GetScheduleEvent>(_getScheduleData);
  }

  final GetScheduleUseCase _getScheduleUseCase;
  Future _getScheduleData(
    GetScheduleEvent event,
    Emitter<HomePageState> emit,
  ) async {
    emit(HomePageLoading());
    final day = [
      'senin',
      'selasa',
      'rabu',
      'kamis',
      'jumat',
      'sabtu',
    ][event.selectedIndex];
    Either<Failure, List<ScheduleEntity>> result =
        (await _getScheduleUseCase.execute(day));
    result.fold(
      (failure) => emit(HomePageFailure(failure: failure)),
      (schedules) => emit(
        HomePageLoaded(event.selectedIndex, schedules: schedules),
      ),
    );
  }

  final GetHomeProfileUseCase _getProfileUseCase;
  Future _getProfileData(
    GetProfileEvent event,
    Emitter<HomePageState> emit,
  ) async {
    emit(HomePageLoading());
    Either<Failure, UserEntity> result = await _getProfileUseCase.execute();
    result.fold(
      (failure) => emit(HomePageFailure(failure: failure)),
      (profile) => emit(UserProfileLoaded(profiles: profile)),
    );
  }
}
