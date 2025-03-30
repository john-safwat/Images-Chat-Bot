import 'package:chat_bot/core/providers/app_config_provider.dart';
import 'package:injectable/injectable.dart';

@injectable
class Validators {
  final AppConfigProvider appConfigProvider;

  Validators(this.appConfigProvider);

  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return appConfigProvider.locale.name_cannot_be_empty;
    }
    final name = value.trim();
    if (name.length < 2) {
      return appConfigProvider.locale.name_min_length;
    }
    if (name.length > 100) {
      return appConfigProvider.locale.name_max_length;
    }
    final nameRegExp = RegExp(r'^[a-zA-Z\u0600-\u06FF\u0750-\u077F\s]+$');
    if (!nameRegExp.hasMatch(name)) {
      return appConfigProvider.locale.name_invalid_chars;
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return appConfigProvider.locale.emailCannotBeEmpty;
    }

    // Standard email regex pattern
    RegExp emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    if (!emailRegex.hasMatch(value)) {
      return appConfigProvider.locale.enterValidEmail;
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return appConfigProvider.locale.password_empty_error;
    }
    if (value.length < 8) {
      return appConfigProvider.locale.password_length_error;
    }
    if (!RegExp(r'(?=.*?[A-Z])').hasMatch(value)) {
      return appConfigProvider.locale.password_uppercase_error;
    }
    if (!RegExp(r'(?=.*?[a-z])').hasMatch(value)) {
      return appConfigProvider.locale.password_lowercase_error;
    }
    if (!RegExp(r'(?=.*?[0-9])').hasMatch(value)) {
      return appConfigProvider.locale.password_number_error;
    }
    if (!RegExp(r'(?=.*?[!@#\$&*~])').hasMatch(value)) {
      return appConfigProvider.locale.password_special_error;
    }
    return null;
  }

  String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return appConfigProvider.locale.confirm_password_empty_error;
    }
    if (value != password) {
      return appConfigProvider.locale.password_match_error;
    }
    return null;
  }
}
