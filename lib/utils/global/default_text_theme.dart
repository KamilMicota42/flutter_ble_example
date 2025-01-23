import 'package:flutter/material.dart';

class DefaultTextTheme {
  static TextStyle? bold22(BuildContext context) =>
      Theme.of(context).textTheme.titleLarge;
  static TextStyle? bold20(BuildContext context) =>
      Theme.of(context).textTheme.titleMedium;
  static TextStyle? bold16(BuildContext context) =>
      Theme.of(context).textTheme.titleSmall;
  static TextStyle? regular16(BuildContext context) =>
      Theme.of(context).textTheme.bodyLarge;
  static TextStyle? regular13(BuildContext context) =>
      Theme.of(context).textTheme.bodyMedium;
  static TextStyle? regular12(BuildContext context) =>
      Theme.of(context).textTheme.bodySmall;
}
