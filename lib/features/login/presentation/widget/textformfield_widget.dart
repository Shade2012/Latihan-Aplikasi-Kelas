import 'package:flutter/material.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/themes/textstyle.dart';



Widget CustomTextFormField({
  String? title,
  required String hint,
  required int validatorID,
  required TextInputType type,
  required TextEditingController controller,
  required bool obsecureText,
  ValueChanged<String>? onChanged,
  VoidCallback? toggleObscureText,
}) {

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (title?.isNotEmpty ?? false)
        Text(
          title!,
          style: txtRegularBlack,
        ),
      SizedBox(height: 10),
      TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: type,
        obscureText: obsecureText,
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color.fromARGB(255, 255, 255, 255),
          focusColor: Color.fromARGB(255, 168, 171, 186),
          suffixIcon: validatorID == 0
              ? IconButton(
            onPressed: toggleObscureText,
            icon: Icon(
              obsecureText ? Icons.visibility : Icons.visibility_off,
              color: Colors.black,
            ),
          )
              : null,
          contentPadding:
          EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Colors.black, width: 2.0),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Color.fromARGB(255, 179, 43, 9)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Color.fromARGB(255, 179, 43, 9)),
          ),
          hintText: hint,
          hintStyle: txtInputHint,
        ),
        validator: (value) {
          if (validatorID == 0) {
            return isPassword(value!);
          } else if (validatorID == 1) {
            return isEmail(value!);
          }
          return null;
        },
      ),
      SizedBox(height: 10),
    ],
  );
}




String? isPassword(String value) {
  if (value.isEmpty) {
    return null;
  }
  if (value.length >= 8) {
    return null; // Password is valid
  }
  return "Password minimal 8 karakter";
}

String? isEmail(String value) {
  if (value.isEmpty) {
    return null;
  }
  if (value.contains("@")) {
    return null;
  }
  return "Email Address tidak valid";
}
