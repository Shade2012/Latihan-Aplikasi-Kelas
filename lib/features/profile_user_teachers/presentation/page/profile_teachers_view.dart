import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/common_button.dart';
import '../bloc/profile_teachers_bloc.dart';
import '../bloc/profile_teachers_event.dart';
import '../bloc/profile_teachers_state.dart';
import '../widget/teachers_profile_widget.dart';
import '../widget/teachers_select_widget.dart';

class ProfileTeachersPage extends StatelessWidget {
  const ProfileTeachersPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProfileTeachersBloc, ProfileTeachersState>(
        bloc: BlocProvider.of<ProfileTeachersBloc>(context)
          ..add(LoadProfileTeachers()),
        builder: (context, state) {
          if (state is ProfileTeachersError) {
            return Center(
              child: Text(
                state.failure.message,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.red,
                ),
              ),
            );
          }
          return SafeArea(
            child: RefreshIndicator(
              onRefresh: () async =>
                  BlocProvider.of<ProfileTeachersBloc>(context).add(
                LoadProfileTeachers(),
              ),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    const TeachersProfileWidget(),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Email ',
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                state is ProfileTeachersLoaded
                                    ? state.profile.email
                                    : 'Loading...',
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          TeachersSelectWidget(),
                          const SizedBox(height: 20),
                          CommonButton(
                            text: 'Log Out',
                            onPressed: () async {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: Colors.green,
                                  content: Text('Log Out Berhasil!'),
                                ),
                              );
                              final prefs =
                                  await SharedPreferences.getInstance();
                              await prefs.remove('token');
                              await prefs.remove('role');
                              await prefs.remove('image');
                              await prefs.remove('name');
                              GoRouter.of(context).go('/login-page');
                            },
                            haveRequirement: false,
                            widget: const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.logout,
                                    size: 24,
                                    color: Colors.white,
                                  ),
                                  Spacer(),
                                  Text(
                                    'Log Out',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 50),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
