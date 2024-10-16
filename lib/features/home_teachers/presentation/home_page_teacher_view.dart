import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/themes/colors.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/presentation/bloc/home_page_teacher_bloc.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/presentation/shimmer/home_page_teacher_shimmer.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/presentation/widget/days_container.dart';

import '../../../../core/themes/images.dart';
import '../../../../core/themes/textstyle.dart';

List<String> daysList = [
  'Senin',
  'Selasa',
  'Rabu',
  'Kamis',
  'Jumat',
  'Sabtu',
];

class HomePageTeacherView extends StatelessWidget {
  const HomePageTeacherView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    // Format the current date to Indonesian format
    String formattedDay = DateFormat.EEEE('id_ID').format(now);
    int groupValue = daysList.indexWhere(
      (element) => element == formattedDay,
    );
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: BlocConsumer<HomePageTeacherBloc, HomePageTeacherState>(
      bloc: context.read<HomePageTeacherBloc>()
        ..add(AllScheduleEvent(selectedIndex: groupValue)),
      builder: (context, state) {
        return Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [ColorsResources.primaryButton, Colors.white],
                  stops: [0.10, 0.90])),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: state is HomePageTeacherLoading
                  ? HomePageTeacherShimmer()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.asset(
                                      Images.imageExample,
                                      fit: BoxFit.cover,
                                      height: 80,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Good Morning 👋",
                                        style: txtRegularBlack),
                                    SizedBox(
                                      height: screenHeight * 0.003,
                                    ),
                                    Text("Abid Fadullah Maajid",
                                        style: txtRegularBlack),
                                  ],
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {
                                context.pushNamed('notification_admin');
                              },
                              icon: const Icon(Icons.notifications),
                            ),
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
                              return BlocBuilder<HomePageTeacherBloc,
                                  HomePageTeacherState>(
                                builder: (context, state) {
                                  return DayContainerTeachers(
                                    value: index,
                                    groupValue: groupValue,
                                    onChanged: (int? value) {
                                      groupValue = value!;
                                      context.read<HomePageTeacherBloc>().add(
                                          AllScheduleEvent(
                                              selectedIndex: groupValue));
                                    },
                                    day: day,
                                  );
                                },
                              );
                            },
                            itemCount: daysList.length,
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                width: 10,
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "Jadwal Hari Ini",
                            style: txtRegularBlack,
                          ),
                        ),
                        Expanded(
                          child: state is HomePageTeacherLoading
                              ? const Center(child: CircularProgressIndicator())
                              : state is HomePageTeacherFailure
                                  ? Center(
                                      child: Text(
                                          'Error: ${state.failure.message}'))
                                  : state is HomePageTeacherLoad
                                      ? ListView.separated(
                                          itemBuilder: (context, index) {
                                            final lecture = state.daySchedules.lectures[index];
                                            return Text(lecture.namaPelajaran);
                                          },
                                          separatorBuilder: (context, index) {
                                            return SizedBox(
                                              height: 20,
                                            );
                                          },
                                          itemCount: state.daySchedules.lectures.length)
                                      : const Center(
                                          child: Text('No data available')),
                        )
                      ],
                    ),
            ),
          ),
        );
      },
      listener: (BuildContext context, HomePageTeacherState state) {},
    ));
  }
}
