import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/changepasswordteacher/bloc/change_password_teacher_bloc.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/changepasswordteacher/bloc/change_password_teacher_event.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/changepasswordteacher/bloc/change_password_teacher_state.dart';
import 'package:flutter/material.dart';

class ChangePasswordTeacherView extends StatefulWidget {
  const ChangePasswordTeacherView({Key? key}) : super(key: key);

  @override
  _ChangePasswordTeacherViewState createState() =>
      _ChangePasswordTeacherViewState();
}

class _ChangePasswordTeacherViewState extends State<ChangePasswordTeacherView> {
  bool _obscureText1 = true;  // For the new password field
  bool _obscureText2 = true;  // For the confirm password field

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
        ChangePasswordTeacherBloc()..add(LoadChangePasswordTeacher()),
        child: BlocBuilder<ChangePasswordTeacherBloc, ChangePasswordTeacherState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
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
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Buat Kata Sandi Baru",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Masukkan kata sandi baru Anda di bawah dan pastikan itu berbeda dari sebelumnya!",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 25),

                  // New Password Field
                  const Text(
                    "Password",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    obscureText: _obscureText1,
                    decoration: InputDecoration(
                      hintText: "Masukkan Password Baru",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText1 ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText1 = !_obscureText1;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Confirm Password Field
                  const Text(
                    "Confirm Password",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    obscureText: _obscureText2,
                    decoration: InputDecoration(
                      hintText: "Masukkan Konfirmasi Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText2 ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText2 = !_obscureText2;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),

                  // Submit Button or any GestureDetector for submission
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context).go('/change_password_confirm_teacher_view');
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        color: const Color(0xFF62C0A1),  // Using your custom color
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        "Change Password",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
