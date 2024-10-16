import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/error/failure.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/domain/entities/kelas_entities.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/domain/entities/lecture_entities.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/domain/entities/pelajaran_entities.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/domain/usecases/get_kelas.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/domain/usecases/get_pelajaran.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/usecases/get_weekly_schedule.dart';

part 'home_page_teacher_event.dart';
part 'home_page_teacher_state.dart';

class HomePageTeacherBloc extends Bloc<HomePageTeacherEvent, HomePageTeacherState> {
  final GetScheduleWeekly getScheduleWeekly;
  final GetKelas getKelas;
  final GetPelajaran getPelajaran;
  HomePageTeacherBloc({required this.getScheduleWeekly,required this.getPelajaran,required this.getKelas}) : super(HomePageTeacherInitial()) {
    on<HomePageTeacherEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<AllScheduleEvent>((event, emit) async {
      emit(HomePageTeacherLoading());
      final prefs = await SharedPreferences.getInstance();
      String? name = prefs.getString('name');
      String? image = prefs.getString('image');
      Either<Failure,List<KelasEntities>> resultKelas = await getKelas.execute();
      Either<Failure,List<PelajaranEntities>> resultPelajaran = await getPelajaran.execute();
      Either<Failure,DaySchedule> result = await getScheduleWeekly.execute(hari: event.hari ?? '',pelajaran: event.pelajaran,kelas: event.kelas);
      resultKelas.fold((failure) {
        emit(HomePageTeacherFailure(failure: failure));
      },(kelasEntities)async {
        resultPelajaran.fold((failure) => emit(HomePageTeacherFailure(failure: failure)), (pelajaranEntities) async {
          result.fold((failure) {
            emit(HomePageTeacherFailure(failure: failure));
          },(schedule) {
            emit(HomePageTeacherLoad(daySchedules: schedule, tabIndex: event.selectedIndex ?? 0, kelasEntities: kelasEntities,pelajaranEntities: pelajaranEntities, name: name ?? '',image:image ?? '' ));
          },);
        },);
      },);

    },);
  }
}
