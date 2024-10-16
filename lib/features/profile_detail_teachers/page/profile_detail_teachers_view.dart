import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/navbar_teachers/presentation/bloc/navbar_bloc.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/profile_detail_teachers/bloc/profile_detail_teachers_bloc.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/profile_detail_teachers/bloc/profile_detail_teachers_event.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/profile_detail_teachers/bloc/profile_detail_teachers_state.dart';

class DetailProfileTeachersView extends StatelessWidget {
  final String userId;

  const DetailProfileTeachersView({Key? key, required this.userId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailProfileBloc()..add(LoadProfileEvent(userId)),
      child: Scaffold(
        body: BlocBuilder<DetailProfileBloc, DetailProfileTeachersState>(
          builder: (context, state) {
            if (state is ProfileTeachersLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProfileTeachersLoadedState) {
              return ProfileDetailView(profileData: state.profileTeachersData);
            } else if (state is ProfileTeachersErrorState) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: Text('Unexpected state'));
            }
          },
        ),
      ),
    );
  }
}

class ProfileDetailView extends StatelessWidget {
  final Map<String, dynamic> profileData;

  const ProfileDetailView({Key? key, required this.profileData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double profileTeachersPictureHeight = 130.0;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align text to the left
          children: [
            // Row for the back button and title
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).go('/navbar_teacher');
                  },
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.grey[300],
                    child: const Icon(Icons.arrow_back, color: Colors.black),
                  ),
                ),
                const Expanded(
                  child: Text(
                    'Detail Profil',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center, // Center title text
                  ),
                ),
                const SizedBox(width: 50),
              ],
            ),
            const SizedBox(height: 20),
            // Profile picture in the center
            Align(
              alignment: Alignment.center, // Center the profile picture
              child: Container(
                width: profileTeachersPictureHeight,
                height: profileTeachersPictureHeight,
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
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/pfpimg.jpg',
                    fit: BoxFit.cover,
                    width: profileTeachersPictureHeight,
                    height: profileTeachersPictureHeight,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Profile details text aligned to the left
            const Text('Informasi profil',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 18),
            const Row(
              children: [
                 Text(
                  'Nama',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
                 Spacer(), // This pushes the next widget to the right
                Text(
                  'Ajar Abu Hairoh',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Divider(
              color: Colors.grey, // Line color
              thickness: 1, // Line thickness
            ),
            const SizedBox(height: 30),
            const Text('Informasi Guru',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 18),
            const Row(
              children: [
                Text(
                  'Email',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(), // This pushes the next widget to the right
                Text(
                  'AjarAH@gmail.com',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
