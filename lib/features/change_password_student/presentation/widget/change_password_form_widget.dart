import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/themes/colors.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/change_password_student/presentation/bloc/change_password_bloc.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/change_password_student/presentation/bloc/change_password_event.dart';
import '../../../../common/appbar_common.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/error/snackbar_error.dart';

class ChangePasswordFormWidget extends StatefulWidget {
  @override
  _ChangePasswordFormWidgetState createState() => _ChangePasswordFormWidgetState();
}

class _ChangePasswordFormWidgetState extends State<ChangePasswordFormWidget> {
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
    // Get the screen height and width
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            context.go('/navbar');
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
              size: screenWidth * 0.05, // Adjust icon size
            ),
          ),
          iconSize: screenWidth * 0.05,
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.02, // Adjusts padding based on screen height
          horizontal: screenWidth * 0.05, // Adjusts padding based on screen width
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Ubah Kata Sandi",
              style: TextStyle(
                fontSize: screenWidth * 0.08, // Adjusts font size based on screen width
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * 0.02), // Adjusts space based on screen height
            Text(
              "Masukkan kata sandi baru Anda di bawah dan pastikan itu berbeda dari sebelumnya!",
              style: TextStyle(
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: screenHeight * 0.03),

            // Old Password Field
            Text(
              "Password Lama",
              style: TextStyle(fontSize: screenWidth * 0.045, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: screenHeight * 0.02),
            TextField(
              controller: _oldPasswordController,
              obscureText: _obscureOldPassword,
              focusNode: _oldPasswordFocusNode,
              onSubmitted: _onOldPasswordSubmitted,
              decoration: InputDecoration(
                hintText: "Masukkan Password Lama",
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
            SizedBox(height: screenHeight * 0.02),

            // New Password Field
            Text(
              "Password Baru",
              style: TextStyle(fontSize: screenWidth * 0.045, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: screenHeight * 0.02),
            TextField(
              controller: _newPasswordController,
              obscureText: _obscureNewPassword,
              focusNode: _newPasswordFocusNode,
              onSubmitted: _onNewPasswordSubmitted,
              decoration: InputDecoration(
                hintText: "Masukkan Password Baru",
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
            SizedBox(height: screenHeight * 0.02),

            // Confirm New Password Field
            Text(
              "Konfirmasi Password Baru",
              style: TextStyle(fontSize: screenWidth * 0.045, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: screenHeight * 0.02),
            TextField(
              controller: _confirmPasswordController,
              obscureText: _obscureConfirmPassword,
              focusNode: _confirmPasswordFocusNode,
              onSubmitted: _onConfirmPasswordSubmitted,
              decoration: InputDecoration(
                hintText: "Konfirmasi Password",
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
            SizedBox(height: screenHeight * 0.05),

            // Submit Button
            GestureDetector(
              onTap: () {
                // Validate passwords before submitting
                if (_newPasswordController.text == _confirmPasswordController.text &&
                    _newPasswordController.text.length >= 8) {
                  // Trigger the change password event with the correct data
                  context.read<ChangePasswordBloc>().add(ChangePasswordRequested(
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
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                decoration: BoxDecoration(
                  color: const Color(0xFF62C0A1),
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Text(
                  "Update Password",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.bold,
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
