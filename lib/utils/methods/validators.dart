import 'package:easy_localization/easy_localization.dart';

class Validators {
  static final _emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)*(\.[a-z]{2,7})$');

  static String? validateEmail(String? emailValue) {
    if (emailValue == null) return 'validatorRequiredField'.tr();
    if (!emailValue.contains("@")) {
      return 'validatorSymbolInTheMail'.tr();
    } else {
      if (!_emailRegExp.hasMatch(emailValue)) {
        return 'validatorAfterSymbol'.tr();
      }
    }

    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null) return 'validatorRequiredField'.tr();
    RegExp lowerCaseRegex = RegExp(r'[a-z]');
    RegExp upperCaseRegex = RegExp(r'[A-Z]');
    RegExp numberRegex = RegExp(r'[0-9]');
    if (lowerCaseRegex.hasMatch(password) && upperCaseRegex.hasMatch(password) && numberRegex.hasMatch(password) && password.length >= 8) {
      return null;
    } else {
      return 'validatorPassword'.tr();
    }
  }

  static String? validateFullname(String? fullName) {
    if (fullName == null) return 'validatorRequiredField'.tr();

    RegExp fullnameRegex = RegExp(r"^\s*([A-Za-ząćęłńóśźżĄĆĘŁŃÓŚŹŻ]{1,}([\.,] |[-']| ))+[A-Za-ząćęłńóśźżĄĆĘŁŃÓŚŹŻ]+\.?\s*$");
    if (fullnameRegex.hasMatch(fullName)) {
      return null;
    } else {
      return 'validatorFullname'.tr();
    }
  }

  static String? validateIsEmpty(String? value) {
    String errorMessage = 'validatorRequiredField'.tr();

    if (value == null || value.isEmpty) {
      return errorMessage;
    }
    return null;
  }
}
