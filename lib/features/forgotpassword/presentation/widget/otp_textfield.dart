import 'package:flutter/material.dart';

import '../../../../core/themes/textstyle.dart';


class VerificationCodeInput extends StatelessWidget {
  final TextEditingController controller;
  final int index;
  final ValueChanged<String> onChanged;

   VerificationCodeInput({
    required this.controller,
    required this.index,
    required this.onChanged, // Accept the callback
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5,vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          border: Border.all(color: Colors.grey)
        ),
        child: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          maxLength: 1,
          textAlign: TextAlign.center,
          onChanged: (String value) {
            onChanged(value);
            if (value.length == 1) {
              if (index == 6) {
                FocusScope.of(context).unfocus();
              } else {
                FocusScope.of(context).nextFocus();
              }
            }
          },
          decoration: InputDecoration(
            counterText: '',
            contentPadding: EdgeInsets.zero, // Ensures no extra padding
            border: OutlineInputBorder(
              borderSide: BorderSide.none
            ),
          ),
          style:otpcode,
        ),
      ),
    );
  }
}
