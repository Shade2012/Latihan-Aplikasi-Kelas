import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/profile_user/bloc/profile_user_bloc.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/profile_user/bloc/profile_user_event.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/profile_user/bloc/profile_user_state.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/profile_user/data/datasource/profile_user_datasource_impl.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/profile_user/repositories/profile_repositories_impl.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/profile_user/domain/usecase/get_profile_user.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/network/dio_instance.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/login/presentation/page/login_page_view.dart';

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
            top: screenHeight * 0.20,
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
                  state.profileUser.image ?? 'assets/images/default.jpg',
                  fit: BoxFit.cover,
                  width: profilePictureHeight,
                  height: profilePictureHeight,
                  errorBuilder: (context, error, stackTrace) {
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
                    color: Color(0xFF808080),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.03),
                _buildDetailRow(context, 'Email', state.profileUser.email),
                SizedBox(height: screenHeight * 0.03),
                Divider(color: Color(0xFFD9D9D9), thickness: 0.9),
                SizedBox(height: screenHeight * 0.01),
                _buildProfileRow(context, Icons.settings, 'Ganti Password', onTap: () {
                  context.push('/change_password_student'); 
                }, iconColor: Color(0xFF808080)), // Change color to 808080
                _buildDivider(),
                SizedBox(height: screenHeight * 0.01),
                _buildProfileRow(context, Icons.info, 'About',  onTap: () {
                  context.push('/about_page'); 
                },iconColor: Color.fromARGB(255, 23, 19, 19)), // Change color to 808080
                _buildDivider(),
                SizedBox(height: screenHeight * 0.01),
                _buildProfileRow(context, Icons.privacy_tip, 'Kebijakan Privasi',onTap: () {
                  context.push('/privacy_policy_teachers_page'); 
                }, iconColor: Color(0xFF808080)), // Change color to 808080
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
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              title: Text(
                'Pesan',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              content: Text(
                'Apakah anda yakin ingin keluar?',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text(
                    'Tidak',
                    style: TextStyle(
                      color: Color(0xFF62C0A1),
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.remove('token');
                    await prefs.remove('role');
                    await prefs.remove('image');
                    await prefs.remove('name');

                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginPageView()),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.green,
                        content: Text('Log Out Berhasil!'),
                      ),
                    );
                  },
                  child: Text(
                    'Iya',
                    style: TextStyle(
                      color: Colors.red[500],
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ],
            );
          },
        );
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildProfileRow(BuildContext context, IconData icon, String title, {VoidCallback? onTap, Color? iconColor}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Icon(icon, color: iconColor ?? Color(0xFF62C0A1)), // Use the provided color or default color
            SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios, size: 16, color: Color(0xFFD9D9D9)),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(color: Color(0xFFD9D9D9), thickness: 0.9);
  }
}
