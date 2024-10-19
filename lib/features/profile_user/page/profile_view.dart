import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/profile_user/bloc/profile_user_bloc.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/profile_user/bloc/profile_user_event.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/profile_user/bloc/profile_user_state.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/profile_user/data/datasource/profile_user_datasource_impl.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/profile_user/repositories/profile_repositories_impl.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/profile_user/domain/usecase/get_profile_user.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/network/dio_instance.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/profile_user/models/profile_model.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  final double profilePictureHeight;

  ProfilePage({this.profilePictureHeight = 88.0});

  @override
  Widget build(BuildContext context) {
    final dioInstance = DioInstance(); 
    final profileUserDataSource = ProfileUserDataSourceImpl(dioInstance: dioInstance); 
    final profileRepository = ProfileUserRepositoryImpl(profileUserDataSource: profileUserDataSource);
    final getProfileUserUseCase = GetProfileUserUseCase(repository: profileRepository); 

    return Scaffold(
      body: BlocProvider(
        create: (context) => ProfileUserBloc(getProfileUserUseCase: getProfileUserUseCase)
          ..add(LoadProfileUser()), 
        child: BlocBuilder<ProfileUserBloc, ProfileUserState>(        
          builder: (context, state) {
            if (state is ProfileUserLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ProfileUserLoaded) {
              return _buildProfileContent(context, state);
            } else if (state is ProfileUserError) {
              return Center(child: Text('Failed to load profile: ${state.message}'));
            } else {
              return Center(child: Text('Something went wrong'));
            }
          },
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 20), 
        _buildLogoutButton(context),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildProfileContent(BuildContext context, ProfileUserLoaded state) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;

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
              child: Image.network(
                '',
                fit: BoxFit.cover,
                width: profilePictureHeight,
                height: profilePictureHeight,
                errorBuilder: (context, error, stackTrace) {
                  print('Error loading network image: $error'); 
                  return Image.asset(
                    'assets/images/default.jpg', 
                    fit: BoxFit.cover,
                    width: profilePictureHeight,
                    height: profilePictureHeight,
                  );
                },
              ),
            ),

            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: screenHeight * 0.32,
              left: screenWidth * 0.05,
              right: screenWidth * 0.05,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  state.profileUser.name,
                  style: TextStyle(
                    fontSize: screenHeight * 0.03,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  state.profileUser.role,
                  style: TextStyle(
                    fontSize: screenHeight * 0.02,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,  
                    color: Color(0xFF62C0A1),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.03),
                _buildDetailRow(context, 'Email', state.profileUser.email),
                SizedBox(height: screenHeight * 0.03),
                Divider(color: Color(0xFFD9D9D9), thickness: 0.9),
                SizedBox(height: screenHeight * 0.01),
                _buildProfileRow(context, Icons.settings, 'Ganti Password'),
                _buildDivider(),
                SizedBox(height: screenHeight * 0.01),
                _buildProfileRow(context, Icons.settings, 'About'),
                _buildDivider(),
                SizedBox(height: screenHeight * 0.01),
                _buildProfileRow(context, Icons.privacy_tip_sharp, 'Kebijakan Privasi'),
                SizedBox(height: screenHeight * 0.01),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).go('/login-page'); // Navigate to login page
      },
      child: Container(
        width: 352,
        height: 44,
        margin: EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.red[500],
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: const Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Icon(Icons.logout, size: 20, color: Colors.white),
              ),
            ),
            Text(
              "Log Out",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context, String title, String value) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$title ',
          style: TextStyle(
            fontSize: screenHeight * 0.02,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: screenHeight * 0.02,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.end,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildProfileRow(BuildContext context, IconData icon, String title) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        // TODO: Implement onTap action for each profile row
      },
      child: Row(
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
            padding: EdgeInsets.only(right: screenWidth * 0.04),
            child: Icon(
              Icons.arrow_forward_ios,
              size: screenHeight * 0.020,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: Color(0xFFD9D9D9),
      thickness: 0.9,
    );
  }
}
