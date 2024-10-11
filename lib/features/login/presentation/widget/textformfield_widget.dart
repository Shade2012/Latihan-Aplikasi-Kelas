import 'package:flutter/material.dart';

import '../../../../core/themes/textstyle.dart';

class CustomTextFormField extends StatefulWidget {
  final String? title;
  final String hint;
  final int validatorID;
  final TextInputType type;
  final TextEditingController controller;
  String? Function(String?)? validator;
  bool obsecureText;
  ValueChanged<String>? onChanged;
  CustomTextFormField({Key? key, required this.title,this.validator ,required this.hint, required this.validatorID, required this.type, required this.controller, required this.obsecureText,this.onChanged}) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title?.isNotEmpty ?? false)
          Text(
            widget.title!,
            style: txtRegularBlack,
          ),
        SizedBox(height: 10),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: widget.type,
          obscureText: widget.obsecureText,
          controller: widget.controller,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            filled: true,
            fillColor: Color.fromARGB(255, 255, 255, 255),
            focusColor: Color.fromARGB(255, 168, 171, 186),
            suffixIcon: widget.validatorID == 0
                ? IconButton(
              onPressed: (){
                setState(() {
                  widget.obsecureText = !widget.obsecureText;
                });
              },
              icon: Icon(
                widget.obsecureText ? Icons.visibility : Icons.visibility_off,
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
            hintText: widget.hint,
            hintStyle: txtInputHint,
          ),
          validator: widget.validator ?? (value) { // Use the custom validator if provided
            if (widget.validatorID == 0) {
              return isPassword(value!);
            } else if (widget.validatorID == 1) {
              return isEmail(value!);
            }
            return null;
          },
        ),
        SizedBox(height: 10),
      ],
    );
  }
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
