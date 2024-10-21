import 'package:flutter/material.dart';

import '../core/themes/textstyle.dart';


class CommonDialog extends StatelessWidget {
  final String title;
  final String content;
  final String cancelText;
  final String confirmText;
  final Function onCancelPressed;
  final Function onConfirmPressed;
  final Color cancelButtonColor;
  final Color confirmButtonColor;
  final Color cancelButtonTextColor;
  final Color confirmButtonTextColor;
  final Widget? dialogImage;

  CommonDialog({
    required this.title,
    required this.content,
    required this.cancelText,
    required this.confirmText,
    required this.onCancelPressed,
    required this.onConfirmPressed,
    this.cancelButtonColor = Colors.red,
    this.confirmButtonColor = Colors.green,
    this.cancelButtonTextColor = Colors.white,
    this.confirmButtonTextColor = Colors.white,
    this.dialogImage,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0,
      backgroundColor: Colors.white,
      title: Text(
        title,
        style: titleDialogButtonTextStyle,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (dialogImage != null) dialogImage!,
          SizedBox(height: dialogImage != null ? 20 : 0),
          Text(
            content,
            style: contentDialogButtonTextStyle,
          ),
        ],
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: onCancelPressed as void Function()?,
                style: TextButton.styleFrom(
                  minimumSize: const Size(120, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.0),
                    side: const BorderSide(color: Colors.white),
                  ),
                  backgroundColor: cancelButtonColor,
                  foregroundColor: cancelButtonTextColor,
                ),
                child: Text(
                  cancelText,
                  style: dialogButtonTextStyle,
                ),
              ),
            ),
            const SizedBox(width: 8), // Add some spacing between the buttons
            Expanded(
              child: TextButton(
                onPressed: onConfirmPressed as void Function()?,
                style: TextButton.styleFrom(
                  minimumSize: const Size(120, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.0),
                    side: const BorderSide(color: Colors.white),
                  ),
                  backgroundColor: confirmButtonColor,
                  foregroundColor: confirmButtonTextColor,
                ),
                child: Text(
                  confirmText,
                  style: dialogButtonTextStyle,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
