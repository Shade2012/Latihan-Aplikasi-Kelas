import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home/presentation/page/home_page_view.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/presentation/home_page_teacher_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bloc/navbar_bloc.dart';

List<Widget> _bodyItems = [
  const HomePageView(),
  Container(),
];

List<Widget> _bodyItemsTeachers = [
  const HomePageTeacherView(),
  Container(),
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

class NavbarView extends StatelessWidget {
  Future<bool> getIsTeacher() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('role') == 'teacher';
  }
  const NavbarView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavbarBloc()..add(CheckRoleEvent()),
      child: BlocBuilder<NavbarBloc, NavbarState>(
        builder: (context, state) {

          return Scaffold(
            body:
            state is NavbarLoading
                ? const Center(
              child: CircularProgressIndicator(),
            )
                : (state is NavbarInitialTeacher)
                ? _bodyItemsTeachers[state.tabIndex]
                : _bodyItems[state.tabIndex],
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
                BlocProvider.of<NavbarBloc>(context).add(ChangeTabEvent(index));
              },
            ),
          );
        },
      ),
    );
  }
}
