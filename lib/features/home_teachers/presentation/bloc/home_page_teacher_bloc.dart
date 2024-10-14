import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/error/failure.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/domain/entities/lecture_entities.dart';

import '../../domain/usecases/get_weekly_schedule.dart';

part 'home_page_teacher_event.dart';
part 'home_page_teacher_state.dart';

class HomePageTeacherBloc extends Bloc<HomePageTeacherEvent, HomePageTeacherState> {
  final GetScheduleWeekly getScheduleWeekly;
  HomePageTeacherBloc({required this.getScheduleWeekly}) : super(HomePageTeacherInitial()) {
    on<HomePageTeacherEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<AllScheduleEvent>((event, emit) async {
      emit(HomePageTeacherLoading());
      await Future.delayed(Duration(seconds: 10));
      Either<Failure,List<DaySchedule>> result = await getScheduleWeekly.execute();
      result.fold((failure) => emit(HomePageTeacherFailure(failure: failure)),(schedule) => emit(HomePageTeacherLoad(daySchedules: schedule, tabIndex: event.selectedIndex)),);
    },);
  }
}
