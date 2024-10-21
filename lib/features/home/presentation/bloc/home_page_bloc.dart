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
    on<GetHomeDataEvent>(_getScheduleData);
  }

  final GetScheduleUseCase _getScheduleUseCase;
  final GetHomeProfileUseCase _getProfileUseCase;
  Future _getScheduleData(
    GetHomeDataEvent event,
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
    Either<Failure, List<ScheduleEntity>> scheduleResult =
        (await _getScheduleUseCase.execute(day));
    Either<Failure, UserEntity> profileResult =
        await _getProfileUseCase.execute();
    emit(
      scheduleResult.fold(
        (failure) => HomePageFailure(
          failure: failure,
        ),
        (schedule) => profileResult.fold(
          (failure) => HomePageFailure(
            failure: failure,
          ),
          (profile) => HomePageLoaded(
            event.selectedIndex,
            schedules: schedule,
            profile: profile,
          ),
        ),
      ),
    );
  }
}
