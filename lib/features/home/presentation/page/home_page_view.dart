import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/themes/images.dart';
import '../bloc/home_page_bloc.dart';
import '../widget/schedule_widget.dart';
import 'package:go_router/go_router.dart';
import '../widget/categories_widget.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    context
        .read<HomePageBloc>()
        .add(GetHomeDataEvent(DateTime.now().weekday - 1));
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  BlocBuilder<HomePageBloc, HomePageState>(
                    builder: (context, state) => Container(
                      margin: const EdgeInsets.only(right: 10),
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        color: state is HomePageLoading
                            ? Colors.grey
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: state is HomePageLoaded
                            ? (state.profile.image == null 
                              || state.profile.image == ''
                                ? Image.asset(
                                    Images.defaultProfile,
                                    fit: BoxFit.cover,
                                    width: 60,
                                    height: 60,
                                  )
                                : Image.network(
                                    state.profile.image ?? '',
                                    fit: BoxFit.cover,
                                    height: 60,
                                    width: 60,
                                    alignment: Alignment.center,
                                  ))
                            : Image.asset(
                                Images.defaultProfile,
                                fit: BoxFit.cover,
                                width: 60,
                                height: 60,
                              ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Selamat Pagi 👋',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Abid Fadullah Maajid',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      context.push(
                          '/notification_user'); // Navigasi ke halaman beranda
                    },
                    icon: const Icon(
                      Icons.notifications_none_outlined,
                      size: 28,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const CategoriesWidget(),
              const SizedBox(height: 15),
              Text(
                'Jadwal hari ini',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              const ScheduleWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
