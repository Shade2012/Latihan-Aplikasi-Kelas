import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home/domain/entities/schedule_entities.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home/domain/usecases/get_schedule.dart';

import '../../../../core/error/failure.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final GetScheduleUseCase getScheduleUseCase;

  HomePageBloc({required this.getScheduleUseCase}) : super(HomePageInitial()) {
    on<HomePageEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<DaySelected>((event, emit) {
      emit(DaySelectedState(event.selectedIndex));
    });
    on<GetSchedule>((event, emit) async {
      emit(HomePageLoading());
      Either<Failure, List<ScheduleEntity>> result =
          (await getScheduleUseCase.execute());
      result.fold(
        (failure) => emit(HomePageFailure(failure: failure)),
        (schedules) => emit(HomePageLoaded(
          schedules: schedules,
        )),
      );
    });
  }
}
