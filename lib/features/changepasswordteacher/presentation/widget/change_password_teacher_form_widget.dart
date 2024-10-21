import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/themes/colors.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/change_password_student/presentation/bloc/change_password_bloc.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/change_password_student/presentation/bloc/change_password_event.dart';
import '../../../../common/appbar_common.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/error/snackbar_error.dart';

import '../../../../core/themes/textstyle.dart';
import '../bloc/change_password_teacher_bloc.dart';
import '../bloc/change_password_teacher_event.dart';

class ChangePasswordTeacherFormWidget extends StatefulWidget {
  @override
  _ChangePasswordTeacherFormWidgetState createState() => _ChangePasswordTeacherFormWidgetState();
}

class _ChangePasswordTeacherFormWidgetState extends State<ChangePasswordTeacherFormWidget> {
  bool _obscureOldPassword = true; // For the old password field
  bool _obscureNewPassword = true; // For the new password field
  bool _obscureConfirmPassword = true; // For the confirm password field
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  // Focus nodes for navigation between text fields
  final FocusNode _oldPasswordFocusNode = FocusNode();
  final FocusNode _newPasswordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();

  @override
  void dispose() {
    _oldPasswordFocusNode.dispose();
    _newPasswordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  void _onOldPasswordSubmitted(String value) {
    if (value.length >= 8) {
      // Move to the next field
      FocusScope.of(context).requestFocus(_newPasswordFocusNode);
    } else {
      SnackBarError.showError(context, "Password Lama harus memiliki minimal 8 karakter.");
    }
  }

  void _onNewPasswordSubmitted(String value) {
    if (value.length >= 8) {
      // Move to the next field
      FocusScope.of(context).requestFocus(_confirmPasswordFocusNode);
    } else {
      SnackBarError.showError(context, "Password Baru harus memiliki minimal 8 karakter.");
    }
  }

  void _onConfirmPasswordSubmitted(String value) {
    if (value.length >= 8) {
      // Optionally you can trigger the change password here or show a final message
    } else {
      SnackBarError.showError(context, "Konfirmasi Password harus memiliki minimal 8 karakter.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            context.go('/navbar_teacher');
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
              size: 20,
            ),
          ),
          iconSize: 20,
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Ubah Kata Sandi",
              style: txtHeading
            ),
            const SizedBox(height: 15),
            Text(
              "Masukkan kata sandi baru Anda di bawah dan pastikan itu berbeda dari sebelumnya!",
              style: txtDescriptionBold
            ),
            const SizedBox(height: 25),

            // Old Password Field
             Text(
              "Password Lama",
              style: txtRegularBlack,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _oldPasswordController,
              obscureText: _obscureOldPassword,
              focusNode: _oldPasswordFocusNode,
              onSubmitted: _onOldPasswordSubmitted,
              decoration: InputDecoration(
                hintText: "Masukkan Password Lama",
                hintStyle: txtInputHint,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureOldPassword ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureOldPassword = !_obscureOldPassword;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),

            // New Password Field
             Text(
              "Password Baru",
              style: txtRegularBlack,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _newPasswordController,
              obscureText: _obscureNewPassword,
              focusNode: _newPasswordFocusNode,
              onSubmitted: _onNewPasswordSubmitted,
              decoration: InputDecoration(
                hintText: "Masukkan Password Baru",
                hintStyle: txtInputHint,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureNewPassword ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureNewPassword = !_obscureNewPassword;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Confirm New Password Field
            Text(
              "Konfirmasi Password Baru",
              style: txtRegularBlack,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _confirmPasswordController,
              obscureText: _obscureConfirmPassword,
              focusNode: _confirmPasswordFocusNode,
              onSubmitted: _onConfirmPasswordSubmitted,
              decoration: InputDecoration(
                hintText: "Konfirmasi Password",
                hintStyle: txtInputHint,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureConfirmPassword = !_obscureConfirmPassword;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 50),

            // Submit Button
            GestureDetector(
              onTap: () {
                // Validate passwords before submitting
                if (_newPasswordController.text == _confirmPasswordController.text &&
                    _newPasswordController.text.length >= 8) {
                  // Trigger the change password event with the correct data
                  context.read<ChangePasswordTeacherBloc>().add(ChangePasswordTeacherRequested(
                    oldPassword: _oldPasswordController.text,
                    newPassword: _newPasswordController.text,
                    token: ('token'),  // Provide actual token if necessary
                    confirmPassword: _confirmPasswordController.text,
                  ));
                } else {
                  // Use SnackBarError to show the message
                  SnackBarError.showError(context, "Kata sandi tidak bisa di ubah");
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  color: const Color(0xFF62C0A1),
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: const Text(
                  "Update Password",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
