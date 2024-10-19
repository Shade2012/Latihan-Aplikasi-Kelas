import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common/common_button.dart';
import '../../../../core/themes/colors.dart';
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
          switch (state) {
            case ProfileTeachersLoading _:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ProfileTeachersError _:
              return Center(
                child: Text(
                  (state).failure.message,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            case ProfileTeachersLoaded _:
              return SafeArea(
                child: Column(
                  children: [
                    const TeachersProfileWidget(),
                    Text(
                      state.profile.name,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      state.profile.role,
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: ColorsResources.primaryButton),
                      textAlign: TextAlign.center,
                    ),
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
                                state.profile.email,
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          TeachersSelectWidget(),
                          const SizedBox(height: 2),
                          CommonButton(
                            text: 'Log Out',
                            onPressed: () =>
                                GoRouter.of(context).go('/login-page'),
                            haveRequirement: false,
                            widget: const Row(
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
                        ],
                      ),
                    ),
                  ],
                ),
              );
            default:
              return const Center(
                child: Text('Loading...'),
              );
          }
        },
      ),
    );
  }
}
