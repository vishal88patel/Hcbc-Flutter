import 'package:flutter/material.dart';

abstract class AppException implements Exception {
  void onException(
      {Function()? onButtonClick,
      String title,
      Function()? onDismissClick,
      String buttonText,
      String dismissButtonText});
}

class CustomException extends AppException {
  String message;

  CustomException(this.message);

  @override
  void onException(
      {Function()? onButtonClick,
      String title = 'Sorry',
      Function()? onDismissClick,
      String buttonText = 'Ok',
      String? dismissButtonText}) {
    debugPrint(message);
  }
}
