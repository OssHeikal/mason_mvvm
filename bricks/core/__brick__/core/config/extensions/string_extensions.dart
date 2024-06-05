import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../resources/resources.dart';
import 'all_extensions.dart';

bool hasMatch(String? s, String p) {
  return (s == null) ? false : RegExp(p).hasMatch(s);
}

extension StringExtension on String? {
  /// Check email validation
  bool validateEmail() => hasMatch(this, Patterns.email);

  /// Check password validation
  bool validatePassword() => hasMatch(this, Patterns.passwordPattern);

  /// Check saudi phone validation
  bool validateSaudiPhoneNumber() => hasMatch(this, Patterns.saudiPhoneNumber);

  /// Check phone validation
  bool validatePhone() => hasMatch(this, Patterns.phone);

  bool validateImage() => hasMatch(this, Patterns.image);

  bool validateName() => hasMatch(this, Patterns.name);

  bool validateSpecialCharacters() => hasMatch(this, Patterns.specialCharacters);

  /// Check URL validation
  bool validateURL() => hasMatch(this, Patterns.url);

  /// Returns true if given  is null
  bool get isNull => this == null;

  /// Returns true if given String is null or isEmpty
  bool get isEmptyOrNull => this == null || (this != null && this!.isEmpty) || (this != null && this! == 'null');

  /// validate password
  bool get isValidPassword => this == null || (this != null && this!.length < 8) || (this != null && this! == 'null');

  // Check null string, return given value if null
  String validate({String value = ''}) {
    if (isEmptyOrNull) {
      return value;
    } else {
      return this!;
    }
  }

  String removeSpaces() {
    return this!.replaceAll(' ', '');
  }

  String removeSpecialCharacters() {
    return this!.replaceAll(RegExp(r'[^\w\s]+'), '');
  }

  String removeSpacesAndSpecialCharacters() {
    return this!.replaceAll(RegExp(r'[^\w\s]+'), '').replaceAll(' ', '');
  }

  String remove(String value) {
    return this!.replaceAll(value, '');
  }

  SizedBox toSvg({double? height, double? width, ColorFilter? colorFilter, Color? color}) {
    if (color != null) colorFilter = ColorFilter.mode(color, BlendMode.srcIn);
    return SizedBox(
      height: height ?? 24,
      width: width ?? 24,
      child: SvgPicture.asset(validate(), fit: BoxFit.fill, colorFilter: colorFilter).center(),
    );
  }

  String putDataIfEmpty({String value = ''}) {
    if (isEmptyOrNull) {
      return value;
    } else {
      return this!;
    }
  }

  bool isDigit() {
    if (validate().isEmpty) {
      return false;
    }
    if (validate().length > 1) {
      for (var r in this!.runes) {
        if (r ^ 0x30 > 9) {
          return false;
        }
      }
      return true;
    } else {
      return this!.runes.first ^ 0x30 <= 9;
    }
  }

  /// Return int value of given string
  int toInt({int defaultValue = 0}) {
    if (this == null) return defaultValue;
    if (isDigit()) {
      return int.parse(this!);
    } else {
      return defaultValue;
    }
  }

  DateTime toDate() {
    if (isEmptyOrNull) {
      return DateTime.now();
    } else {
      return DateTime.tryParse(this!) ?? DateTime.now();
    }
  }

  /// Return double value of given string
  double toDouble({double defaultValue = 0.0}) {
    if (this == null) return defaultValue;
    try {
      return double.tryParse(this!) ?? 0;
    } catch (e) {
      return defaultValue;
    }
  }

  String get capitalize {
    if (isEmptyOrNull) {
      return '';
    }
    return '${this![0].toUpperCase()}${this!.substring(1)}';
  }

  String get capitalizeFirstOfEach {
    if (isEmptyOrNull) {
      return '';
    }
    return this!.split(' ').map((str) => str.capitalize).join(' ');
  }

  String getInitials() {
    if (isEmptyOrNull) {
      return '';
    }
    return this!.split(' ').map((e) => e[0]).join();
  }

  bool isArabicWord() {
    if (isEmptyOrNull) {
      return false;
    }
    return RegExp(r'[\u0621-\u064A]').hasMatch(this!);
  }

  String getInitial() {
    if (isEmptyOrNull) {
      return '';
    }
    return this![0];
  }

  // get first letter of first name and last name
  String getInitialsOfName() {
    if (isEmptyOrNull) {
      return '';
    }
    final List<String> names = this!.split(' ');
    if (isArabicWord()) {
      return names[0][0];
    } else {
      if (names.length == 1) {
        return names[0][0].toUpperCase();
      } else {
        if (names[1].isEmptyOrNull) {
          return names[0][0].toUpperCase();
        } else {
          return '${names[0][0]}${names[1][0]}'.toUpperCase();
        }
      }
    }
  }
}

class Patterns {
  static String url =
      r'^((?:.|\n)*?)((http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?)';

  static String phone = r'(^(?:[+0]9)?[0-9]{10,12}$)';

  static String saudiPhoneNumber = r'^05[0-9]{8}$';

  static String passwordPattern =
      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>])[A-Za-z\d!@#$%^&*(),.?":{}|<>]{8,200}$';

  static String money = r'^\d{1,3}(,\d{3})*(\.\d+)?$';

  // and arabic letters
  static String specialCharacters = r'[!@#$%^&*(),.?":{}|<>]';

  static String email = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  static String image = r'.(jpeg|jpg|gif|png|bmp)$';

  // static String name = r'[!@#%^&*(),.?":{}|<>]';

  // english and arabic letters
  static String name = r'^[a-zA-Z\u0621-\u064A]+(?:[\s-][a-zA-Z\u0621-\u064A]+)*$';

  // static String name = r'^[a-zA-Z\u0621-\u064A]+(?:[\s-][a-zA-Z\u0621-\u064A]+)*$';

  // static String name = r'^[a-zA-Z]+(?:[\s-][a-zA-Z]+)*$';

  /// Excel regex
  static String excel = r'.(xls|xlsx)$';

  /// PDF regex
  static String pdf = r'.pdf$';

  /// Price regex
  static String price = r'(\d{1,3})(?=(\d{3})+(?!\d))';
}

class Validator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty || !value.validateEmail()) {
      return LocaleKeys.validator_email.tr();
    }
    return null;
  }

  static String? validatePhoneSa(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validator_phone.tr();
    }
    if (!value.validateSaudiPhoneNumber()) {
      return LocaleKeys.validator_phone.tr();
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.length < 8 || value.length > 200) {
      return LocaleKeys.validator_password.tr();
    } else if (!value.validatePassword()) {
      return LocaleKeys.validator_password_pattern.tr();
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty || value != password) {
      return LocaleKeys.validator_confirm_password.tr();
    }
    return null;
  }

  static String? validateName(String? value) {
    final name = value?.trim();
    if (name == null || name.isEmpty || name.replaceAll(" ", "").length < 3) {
      return LocaleKeys.validator_name.tr();
    } else if (!name.validateName() || name.validateSpecialCharacters() || name.isDigit()) {
      return LocaleKeys.validator_name_pattern.tr();
    }
    return null;
  }
  // static String? validateName(String? value) {
  //   if (value == null || value.isEmpty || value.length < 3) {
  //     return LocaleKeys.validator_name.tr();
  //   } else if (!value.validateName() || value.validateSpecialCharacters()) {
  //     return LocaleKeys.validator_name_pattern.tr();
  //   }
  //   return null;
  // }

  static String? validateEmpty(String? value) {
    if (value == null || value.trim().isEmpty) {
      return LocaleKeys.validator_required.tr();
    }
    return null;
  }

  static String? validateOTP(String? value) {
    if (value == null || value.isEmpty || value.length < 4) {
      return LocaleKeys.validator_otp.tr();
    }
    return null;
  }

  static String? validateBirthDate(DateTime? value) {
    if (value == null) {
      return LocaleKeys.validator_birth_date.tr();
    }
    return null;
  }

  static String? validateLatLng(double? value) {
    if (value == null) {
      return LocaleKeys.validator_location.tr();
    }
    return null;
  }
}
