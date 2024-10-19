import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home/domain/entities/schedule_entities.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home/domain/usecases/get_schedule.dart';

import '../../../../core/error/failure.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc({
    required GetScheduleUseCase getScheduleUseCase,
  })  : _getScheduleUseCase = getScheduleUseCase,
        super(HomePageInitial()) {
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
    result.fold((failure) => emit(HomePageFailure(failure: failure)),
        (schedules) {
      emit(HomePageLoaded(event.selectedIndex, schedules: schedules));
    });
  }
}
