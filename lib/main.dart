import 'package:chat_bot/core/constants/constants.dart';
import 'package:chat_bot/core/di/di.dart';
import 'package:chat_bot/core/l10n/translations/app_localizations.dart';
import 'package:chat_bot/core/providers/app_config_provider.dart';
import 'package:chat_bot/core/routes/app_routs.dart';
import 'package:chat_bot/core/theme/app_theme.dart';
import 'package:chat_bot/presentation/onboarding/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await configureApp();
  runApp(
    ChangeNotifierProvider.value(
      value: getIt<AppConfigProvider>(),
      child: MyApp(),
    ),
  );
}

Future<void> configureApp() async{
  SharedPreferences preferences= getIt<SharedPreferences>();
  String local = preferences.getString(Constants.localeKey) ?? Constants.enLocaleKey;
  bool isDark = preferences.getBool(Constants.themeKey) ?? true;
  getIt<AppConfigProvider>().changeLocal(local);
  getIt<AppConfigProvider>().changeTheme(isDark? ThemeMode.dark: ThemeMode.light);
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {

  MyApp({super.key});
  late AppConfigProvider appConfigProvider;
  @override
  Widget build(BuildContext context) {
    appConfigProvider = Provider.of(context);
    return MaterialApp(
      theme: lightTheme.theme,
      darkTheme: darkTheme.theme,
      themeMode: appConfigProvider.getTheme(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(appConfigProvider.getLocal()),
      initialRoute: AppRouts.onboarding,
      routes: {AppRouts.onboarding: (_) => const OnboardingView()},
    );
  }
}
