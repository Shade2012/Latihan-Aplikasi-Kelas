import 'package:flutter/material.dart';

class SnackbarSuccess {
  static void showSuccess(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Text(message,style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
