import 'package:flutter/material.dart';

class ToastUtils {
  static void showToast(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        width: 120,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 5),
        content: Text(msg, textAlign: TextAlign.center),
      ),
    );
  }
}
