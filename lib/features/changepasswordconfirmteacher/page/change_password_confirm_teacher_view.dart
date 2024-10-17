import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/changepasswordconfirmteacher/bloc/change_password_confirm_teacher_bloc.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/changepasswordconfirmteacher/bloc/change_password_confirm_teacher_event.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/changepasswordconfirmteacher/bloc/change_password_confirm_teacher_state.dart';

class ChangePasswordConfirmTeacherView extends StatelessWidget {
  const ChangePasswordConfirmTeacherView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ChangePasswordConfirmTeacherBloc()
          ..add(LoadChangePasswrodConfirmTeacher()),
        child: BlocBuilder<ChangePasswordConfirmTeacherBloc,
            ChangePasswordConfirmTeacherState>(builder: (context, state) {
          return Padding(padding: EdgeInsets.all(16),child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context).go('/change_password_teacher_view');
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
                "Perubahan Password",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                "Kata sandi Anda telah berhasil diubah. klik konfirmasi untuk menyetel kata sandi baru",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
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
                    "Konfirmasi",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),);
        }),
      ),
    );
  }
}
