import 'package:flutter/material.dart';

import '../const/app_colors.dart';
import '../global/font_families.dart';

final GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();

void showSnackBar(String text) {
  snackbarKey.currentState?.removeCurrentSnackBar();
  snackbarKey.currentState?.showSnackBar(
    SnackBar(
      content: Text(
        text,
        style: TextStyle(
          fontFamily: FontFamilies.titilliumWeb,
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: AppColors.white,
        ),
      ),
      backgroundColor: AppColors.black,
      behavior: SnackBarBehavior.floating,
      elevation: 6,
    ),
  );
}
