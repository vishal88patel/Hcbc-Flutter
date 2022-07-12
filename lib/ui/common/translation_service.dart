import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TranslationService extends Translations {
  static Locale get locale => Get.deviceLocale!;
  static const fallbackLocale = Locale('en', 'US');

  @override
  Map<String, Map<String, String>> get keys => {};
}
