
import 'package:chat_bot/core/constants/constants.dart';
import 'package:chat_bot/core/di/di.dart';
import 'package:chat_bot/core/l10n/translations/app_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class AppConfigProvider extends ChangeNotifier {
  String _currentLocal = Constants.enLocaleKey;
  ThemeMode _themeMode = ThemeMode.dark;
  late AppLocalizations locale;

  User? user;

  void setUser(User user){
    this.user = user;
    notifyListeners();
  }

  Future<void> changeLocal(String newLocal) async {
    locale = await AppLocalizations.delegate.load(Locale(newLocal));
    if (newLocal == _currentLocal) {
      return;
    }
    SharedPreferences prefs = getIt<SharedPreferences>();
    _currentLocal = newLocal;
    await prefs.setString(Constants.localeKey, _currentLocal);
    notifyListeners();
  }

  Future<void> changeTheme(ThemeMode newTheme) async {
    if (newTheme == _themeMode) {
      return;
    }
    SharedPreferences prefs = getIt<SharedPreferences>();
    _themeMode = newTheme;
    await prefs.setBool(Constants.themeKey, isDark());
    notifyListeners();
  }

  bool isEn() {
    return _currentLocal == Constants.enLocaleKey;
  }

  bool isDark(){
    return _themeMode == ThemeMode.dark;
  }
  String getLocal() {
    return _currentLocal;
  }

  ThemeMode getTheme (){
    return _themeMode;
  }
}
