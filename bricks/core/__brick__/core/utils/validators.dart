import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/config/extensions/all_extensions.dart';
import 'package:file_picker/file_picker.dart';

import '../resources/resources.dart';

class Validator {
  static String? validateURL(String? value, {bool isRequired = false}) {
    if (value == null || value.isEmpty) {
      return isRequired ? LocaleKeys.validator_url.tr() : null;
    }
    if (!value.validateURL()) {
      return LocaleKeys.validator_url.tr();
    }
    return null;
  }

  static String? validateEmail(String? value, {bool isRequired = true}) {
    if (value == null || value.isEmpty) {
      return isRequired ? LocaleKeys.validator_email.tr() : null;
    }
    if (!value.validateEmail()) {
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

  static String? validatePhone(String? value, {bool isRequired = true}) {
    if (value == null || value.isEmpty) {
      return isRequired ? LocaleKeys.validator_phone.tr() : null;
    }
    if (!value.validatePhone()) {
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
      return LocaleKeys.validator_filed_required.tr();
    }
    return null;
  }

  static String? validateOTP(String? value) {
    if (value == null || value.isEmpty || value.length < 4) {
      return LocaleKeys.validator_otp.tr();
    }
    return null;
  }

  static String? validateImage(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validator_image.tr();
    }
    return null;
  }

  static String? validateFile(
    File? value, {
    bool isRequired = true,
    String? message,
    String? title,
    int maxFileSize = 2,
  }) {
    if (value == null || value.path.isEmpty) {
      return message ?? LocaleKeys.validator_file.tr(args: [title ?? '']);
    } else if (value.lengthSync().bytesToMegaBytes > maxFileSize) {
      return LocaleKeys.validator_file_size.tr(args: [maxFileSize.toString()]);
    }
    return null;
  }

  static String? validatePlatformFile(
    PlatformFile? value, {
    bool isRequired = true,
    String? message,
    int? maxFileSize,
    String? title,
  }) {
    title = title?.toLowerCase() ?? '';
    if (value == null && isRequired) {
      return message ?? LocaleKeys.validator_file.tr(args: [title]);
    }
    if (maxFileSize != null && value != null && value.size.bytesToMegaBytes > maxFileSize) {
      return LocaleKeys.validator_file_size.tr(args: [maxFileSize.toString()]);
    }
    return null;
  }

  static String? validateCommercialNumber(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validator_commercial_number.tr();
    }
    if (value.length < 10) {
      return LocaleKeys.validator_commercial_number_pattern.tr();
    }
    return null;
  }

  static String? validateVatNumber(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validator_commercial_vat.tr();
    }
    if (value.length < 10) {
      return LocaleKeys.validator_commercial_vat_pattern.tr();
    }
    return null;
  }

  static String? validateNumber(
    String? value, {
    bool isRequired = true,
    String? title,
    String? message,
    int? min,
    int? max,
    int? length,
  }) {
    title = title?.toLowerCase().capitalize ?? '';
    if ((value == null || value.isEmpty) && isRequired) {
      return message ?? LocaleKeys.validator_required.tr(args: [title]);
    }
    if (value != null && value.isNotEmpty) {
      if (length != null && value.length != length) {
        return LocaleKeys.validator_digits.tr(args: [title, length.toString()]);
      }
      if (min != null && (value.length) < min) {
        return LocaleKeys.validator_min_digits.tr(args: [title, min.toString()]);
      }
      if (max != null && (value.length) > max) {
        return LocaleKeys.validator_max_digits.tr(args: [title, max.toString()]);
      }
    }
    return null;
  }
}
