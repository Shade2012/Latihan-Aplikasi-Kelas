import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/profile_user/bloc/profile_bloc.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/profile_user/bloc/profile_event.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/profile_user/bloc/profile_state.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/profile_user/repositories/profile_repositories.dart';

class ProfilePage extends StatelessWidget {
  final double profilePictureHeight;


  ProfilePage({this.profilePictureHeight = 88.0});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;

    return Scaffold(
      body: BlocProvider(
        create: (context) => ProfileBloc(profileRepository: ProfileRepository())
          ..add(LoadProfile()),
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ProfileLoaded) {
              print(state.profile.role);
              return SingleChildScrollView(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: screenWidth,
                          height: screenHeight * 0.25,
                          color: Color(0xFF62C0A1),
                        ),
                        Container(
                          width: screenWidth,
                          height: screenHeight * 0.2,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    Positioned(
                      top: screenHeight * 0.18,
                      left: screenWidth / 2 - profilePictureHeight / 2,
                      child: Container(
                        width: profilePictureHeight,
                        height: profilePictureHeight,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 4.0,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 4,
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/pfpimg.jpg',
                            fit: BoxFit.cover,
                            width: profilePictureHeight,
                            height: profilePictureHeight,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: screenHeight * 0.32,
                          left: screenWidth * 0.05,
                          right: screenWidth * 0.05),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            state.profile.name,
                            style: TextStyle(
                              fontSize: screenHeight * 0.03,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            state.profile.role,
                            style: TextStyle(
                              fontSize: screenHeight * 0.02,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF62C0A1),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: screenHeight * 0.03),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Email ',
                                style: TextStyle(
                                  fontSize: screenHeight * 0.02,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                state.profile.email,
                                style: TextStyle(
                                  fontSize: screenHeight * 0.02,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Divider(
                            color: Color(0xFFD9D9D9),
                            thickness: 0.9,
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          // Detail Profile Row
                          _buildProfileRow(
                            context,
                            Icons.description_rounded,
                            'Detail Profil',
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Divider(
                            color: Color(0xFFD9D9D9),
                            thickness: 0.9,
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          // Settings Row
                          _buildProfileRow(
                            context,
                            Icons.settings,
                            'Pengaturan',
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Divider(
                            color: Color(0xFFD9D9D9),
                            thickness: 0.9,
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          // About Row
                          _buildProfileRow(
                            context,
                            Icons.info_rounded,
                            'Tentang',
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Divider(
                            color: Color(0xFFD9D9D9),
                            thickness: 0.9,
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          // Privacy Policy Row
                          _buildProfileRow(
                            context,
                            Icons.privacy_tip_sharp,
                            'Kebijakan Privasi',
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Divider(
                            color: Color(0xFFD9D9D9),
                            thickness: 0.9,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is ProfileError) {
              return Center(
                  child: Text('Failed to load profile: ${state.message}'));
            } else {
              return Center(child: Text('Something went wrong'));
            }
          },
        ),
      ),
    );
  }

  Widget _buildProfileRow(BuildContext context, IconData icon, String title) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.04),
          child: Icon(
            icon,
            size: screenHeight * 0.031,
            color: Colors.black87,
          ),
        ),
        SizedBox(width: screenWidth * 0.06),
        Text(
          title,
          style: TextStyle(
            fontSize: screenHeight * 0.025,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.only(right: screenWidth * 0.04), // Add right padding
          child: Icon(
            Icons.arrow_forward_ios_sharp,
            size: screenHeight * 0.025,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
