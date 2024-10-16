import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/themes/icons.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/domain/entities/pelajaran_entities.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/presentation/bloc/home_page_teacher_bloc.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/presentation/shimmer/home_page_teacher_shimmer.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/presentation/shimmer/lecture_container_shimmer.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/presentation/widget/days_container.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/presentation/widget/detail_pelajaran.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/presentation/widget/dropdown_filter_mata_pelajaran.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/presentation/widget/kelas_filter_container.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/presentation/widget/lecture_container.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/presentation/widget/profile_box.dart';
import '../../../../core/themes/images.dart';
import '../../../../core/themes/textstyle.dart';
import '../shimmer/dropdown_shimmer.dart';
List<String> daysList = [
  'Senin',
  'Selasa',
  'Rabu',
  'Kamis',
  'Jumat',
  'Sabtu',
];
List<String> pelajaran = [
  '14', //'IOT',
  '15', //'Desktop Programming',
];
List<String> kelas = [
  '4', // '10 Animasi 2',
  '8', // '11 DKV 2',
];
class HomePageTeacherView extends StatelessWidget {
  const HomePageTeacherView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    // Format the current date to Indonesian format
    String? selectedKelas = '';
    String selectedPelajaran = 'Semua Pelajaran';
    String formattedDay = DateFormat.EEEE('id_ID').format(now);
    int groupValue = daysList.indexWhere((element) => element == formattedDay,);
    String selectedDay = formattedDay;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocConsumer<HomePageTeacherBloc,HomePageTeacherState>(
        bloc: context.read<HomePageTeacherBloc>()..add(AllScheduleEvent(selectedIndex: groupValue, hari: formattedDay)),
        builder: (context, state) {
          return SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileBox(),
                    Row(
                      children: [
                        Expanded(
                          child: DropdownFilterMataPelajaran(selectedPelajaran: selectedPelajaran,onChanged:(String? value) {
                            selectedPelajaran = value ?? 'Semua Pelajaran';
                            selectedDay = daysList[groupValue];
                                        context.read<HomePageTeacherBloc>().add(AllScheduleEvent(selectedIndex: groupValue, hari: selectedDay,kelas: selectedKelas, pelajaran: selectedPelajaran)
                                        );
                                        },),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(60, 0, 0, 0),
                                  offset: Offset(1, 1),
                                  blurRadius: 10,
                                  spreadRadius: 0
                              )
                            ],
                          ),
                            child: InkWell(
                              onTap: () {
                                showModalBottomSheet(context: context, builder: (context) {
                                 return KelasFilterContainer(listKelas: state is HomePageTeacherLoad ? state.kelasEntities:[],selectedKelas: selectedKelas ?? '',
                                   onChanged: (String? value) {
                                   selectedKelas = value;
                                   context.read<HomePageTeacherBloc>().add(AllScheduleEvent(selectedIndex: groupValue, hari: selectedDay,kelas: selectedKelas, pelajaran: selectedPelajaran)
                                   );
                                   },
                                 );
                                },);
                              },
                                child: SvgPicture.asset(IconsThemes.iconFilterKelas,width: 25,height: 25,color: Colors.grey,)
                            )
                        )
                      ],
                    ),
                    SizedBox(
                      width: screenWidth,
                      height: screenHeight * 0.11,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final day = daysList[index];
                          return BlocBuilder<HomePageTeacherBloc,HomePageTeacherState>(
                            builder: (context, state) {
                              return DayContainerTeachers(value: index, groupValue: groupValue, onChanged: (int? value) {
                                groupValue = value!;
                                selectedDay = daysList[groupValue];
                                 context.read<HomePageTeacherBloc>().add(AllScheduleEvent(selectedIndex: groupValue, hari: selectedDay,kelas: selectedKelas, pelajaran: selectedPelajaran)
                                );
                              }, day: day,);
                            },
                          );
                        },itemCount: daysList.length,separatorBuilder: (context, index) {
                        return SizedBox(width: 10,);
                      },),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text("Jadwal Hari Ini",style: txtRegularBlack,),
                    ),
                    BlocBuilder<HomePageTeacherBloc,HomePageTeacherState>(
                        builder: (context, state) {
                          if(state is HomePageTeacherLoading){
                            return LectureContainerShimmer();
                          }
                          if(state is HomePageTeacherLoad){
                            final lecture = state.daySchedules.lectures;
                            if(lecture.length >= 1 ){
                              return SizedBox(
                                height: screenHeight * 0.5,
                                child: ListView.builder(
                                  itemBuilder: (context, index) {
                                      final detailLecture = lecture[index];
                                      return InkWell(
                                        onTap: () {
                                          DetailPelajaran(context, detailLecture,state.image ?? '');
                                        },
                                          child: LectureContainerSecond(day:detailLecture.hari,room: detailLecture.ruang,subject: detailLecture.namaPelajaran,teacher: detailLecture.guru,time: detailLecture.jamMulai )
                                      );
                                  },
                                  itemCount: state.daySchedules.lectures.length,
                                ),
                              );
                            }else{
                              return Padding(
                                  padding:  EdgeInsets.only(top:screenHeight * 0.3),
                                  child: const Center(child: Text('Tidak Ada Jadwal Mengajar',textAlign: TextAlign.center,))); // Handle out of bounds
                            }
                          }
                          else{
                            return Padding(
                              padding:  EdgeInsets.only(top:screenHeight * 0.3),
                              child:  Center(child: Text(state is HomePageTeacherFailure ? state.failure.message : '')),
                            );
                          }
                        },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        listener: (BuildContext context, HomePageTeacherState state) {
        },
      )
    );
  }
}
