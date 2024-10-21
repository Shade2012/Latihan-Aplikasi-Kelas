import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/themes/colors.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/change_password_student/presentation/bloc/change_password_bloc.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/change_password_student/presentation/bloc/change_password_event.dart';
import '../../../../common/appbar_common.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/error/snackbar_error.dart';

import '../../../../core/themes/textstyle.dart'; // Importing the consistent text styles

class ChangePasswordFormWidget extends StatefulWidget {
  @override
  _ChangePasswordFormWidgetState createState() => _ChangePasswordFormWidgetState();
}

class _ChangePasswordFormWidgetState extends State<ChangePasswordFormWidget> {
  bool _obscureOldPassword = true;
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  final FocusNode _oldPasswordFocusNode = FocusNode();
  final FocusNode _newPasswordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();

  @override
  void dispose() {
    _oldPasswordFocusNode.dispose();
    _newPasswordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onOldPasswordSubmitted(String value) {
    if (value.length >= 8) {
      FocusScope.of(context).requestFocus(_newPasswordFocusNode);
    } else {
      SnackBarError.showError(context, "Password Lama harus memiliki minimal 8 karakter.");
    }
  }

  void _onNewPasswordSubmitted(String value) {
    if (value.length >= 8) {
      FocusScope.of(context).requestFocus(_confirmPasswordFocusNode);
    } else {
      SnackBarError.showError(context, "Password Baru harus memiliki minimal 8 karakter.");
    }
  }

  void _onConfirmPasswordSubmitted(String value) {
    if (value.length >= 8) {
      // Trigger the change password event or show a message
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
            context.pop();
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
              style: txtHeading,
            ),
            const SizedBox(height: 15),
            Text(
              "Masukkan kata sandi baru Anda di bawah dan pastikan itu berbeda dari sebelumnya!",
              style: txtDescriptionBold,
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
                if (_newPasswordController.text == _confirmPasswordController.text &&
                    _newPasswordController.text.length >= 8) {
                  context.read<ChangePasswordBloc>().add(ChangePasswordRequested(
                    oldPassword: _oldPasswordController.text,
                    newPassword: _newPasswordController.text,
                    token: ('token'),
                    confirmPassword: _confirmPasswordController.text,
                  ));
                } else {
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
