import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/change_password_confirm_student/bloc/change_password_confirm_student_bloc.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/change_password_confirm_student/bloc/change_password_confirm_student_event.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/change_password_confirm_student/bloc/change_password_confirm_student_state.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/themes/colors.dart'; // For colors

class ChangePasswordConfirmStudentPage extends StatelessWidget {
  const ChangePasswordConfirmStudentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            context.go('/change_password_student');
          },
          icon: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: ColorsResources.greyAppBar,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
              size: 20, // Set the icon size here
            ),
          ),
          iconSize: 20, // Ensures the IconButton size matches the icon size
          padding: EdgeInsets.zero, // Remove default padding from IconButton
          constraints: BoxConstraints(), // Remove the default constraints
        ),
      ),
      body: BlocProvider(
        create: (context) => ChangePasswordConfirmStudentBloc()
          ..add(LoadChangePasswordConfirmStudent()),
        child: BlocBuilder<ChangePasswordConfirmStudentBloc,
            ChangePasswordConfirmStudentState>(builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(screenWidth * 0.04), // Responsive padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.03), // Responsive height

                // Title "Perubahan Password"
                Text(
                  "Perubahan Password",
                  style: TextStyle(
                    fontSize: screenHeight * 0.03, // Responsive font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02), // Responsive height

                // Description text
                Text(
                  "Kata sandi Anda telah berhasil diubah. Klik konfirmasi untuk menyetel kata sandi baru.",
                  style: TextStyle(
                    fontSize: screenHeight * 0.018, // Responsive font size
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: screenHeight * 0.05), // Responsive height

                // Confirmation button
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).go('/navbar');
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02), // Responsive padding
                    decoration: BoxDecoration(
                      color: const Color(0xFF62C0A1), // Custom color
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Konfirmasi",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenHeight * 0.022, // Responsive font size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.05), // Optional space below button
              ],
            ),
          );
        }),
      ),
    );
  }
}
