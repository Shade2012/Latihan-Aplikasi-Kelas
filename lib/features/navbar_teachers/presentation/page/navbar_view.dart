import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/themes/colors.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home/presentation/page/home_page_view.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/presentation/page/home_page_teacher_view.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/profile_user_teachers/page/profile_teachers_view.dart';
import '../../../../core/themes/icons.dart';
import '../bloc/navbar_bloc.dart';
List<Widget> _bodyItems = [
  const HomePageTeacherView(),
  ProfileTeachersPage()
];

class NavbarTeacherView extends StatelessWidget {
  const NavbarTeacherView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavbarBlocTeacher(),
      child: BlocBuilder<NavbarBlocTeacher, NavbarStateTeacher>(
        builder: (context, state) {
          return Scaffold(
            body: _bodyItems[state.tabIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  icon: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300), // animation duration
                        width: state.tabIndex == 0 ? 50 : 0, // animate width
                        height: 3, // slightly increased height for visibility
                        color: ColorsResources.primaryButton, // green color for the indicator
                      ),
                      const SizedBox(height: 10),
                      SvgPicture.asset(
                        IconsThemes.iconNavigationHomeTeacher,
                        color: state.tabIndex == 0
                            ? ColorsResources.primaryButton
                            : Colors.grey, // change icon color based on selection
                      )
                    ],
                  ),
                  label: 'Beranda',
                ),
                BottomNavigationBarItem(
                  icon: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: state.tabIndex == 1 ? 50 : 0,
                        height: 3,
                        color: ColorsResources.primaryButton,
                      ),
                      const SizedBox(height: 10),
                      SvgPicture.asset(
                        IconsThemes.iconNavigationProfileeacher,
                        color: state.tabIndex == 1
                            ? ColorsResources.primaryButton
                            : Colors.grey,
                      )
                    ],
                  ),
                  label: 'Profil',
                ),
              ],
              currentIndex: state.tabIndex,
              selectedLabelStyle: GoogleFonts.poppins(
                  fontSize: 10, fontWeight: FontWeight.w600),
              unselectedLabelStyle: GoogleFonts.poppins(
                  fontSize: 10, fontWeight: FontWeight.w600),
              selectedItemColor: ColorsResources.primaryButton,
              unselectedItemColor: Colors.grey,
              backgroundColor: Colors.white,
              elevation: 0,
              iconSize: 26,
              onTap: (index) {
                BlocProvider.of<NavbarBlocTeacher>(context).add(ChangeTabEvent(index));
              },
            ),
          );
        },
      ),
    );
  }
}

