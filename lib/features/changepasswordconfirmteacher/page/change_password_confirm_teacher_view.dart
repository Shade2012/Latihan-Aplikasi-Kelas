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
            ],
          ),);
        }),
      ),
    );
  }
}
