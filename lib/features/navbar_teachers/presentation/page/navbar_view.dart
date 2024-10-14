import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home/presentation/page/home_page_view.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/presentation/page/home_page_teacher_view.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/login/presentation/page/login_page_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bloc/navbar_bloc.dart';

List<Widget> _bodyItems = [
  const HomePageTeacherView(),
  LoginPageView(),
];


List<BottomNavigationBarItem> _navbarItems = [
  const BottomNavigationBarItem(
    icon: Icon(Icons.home_rounded),
    label: 'Home',
  ),
  const BottomNavigationBarItem(
    icon: Icon(Icons.person_rounded),
    label: 'Profile',
  ),
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
              items: _navbarItems,
              currentIndex: state.tabIndex,
              selectedLabelStyle: GoogleFonts.poppins(
                  fontSize: 10, fontWeight: FontWeight.w600),
              unselectedLabelStyle: GoogleFonts.poppins(
                  fontSize: 10, fontWeight: FontWeight.w600),
              selectedItemColor: Theme.of(context).colorScheme.primary,
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
