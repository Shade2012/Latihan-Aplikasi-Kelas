import 'package:flutter/material.dart';

class SnackBarError {
  static void showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(message,style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
