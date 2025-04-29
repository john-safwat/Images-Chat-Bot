import 'package:chat_bot/core/constants/constants.dart';
import 'package:chat_bot/core/di/di.dart';
import 'package:chat_bot/core/l10n/translations/app_localizations.dart';
import 'package:chat_bot/core/providers/app_config_provider.dart';
import 'package:chat_bot/core/routes/app_routs.dart';
import 'package:chat_bot/core/theme/app_theme.dart';
import 'package:chat_bot/firebase_options.dart';
import 'package:chat_bot/presentation/action_selection/action_selection_view.dart';
import 'package:chat_bot/presentation/auth/views/forget_password_view.dart';
import 'package:chat_bot/presentation/auth/views/login_view.dart';
import 'package:chat_bot/presentation/auth/views/register_view.dart';
import 'package:chat_bot/presentation/home/home_view.dart';
import 'package:chat_bot/presentation/onboarding/onboarding_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:no_screenshot/no_screenshot.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await configureDependencies();
  await configureApp();
  runApp(
    ChangeNotifierProvider.value(
      value: getIt<AppConfigProvider>(),
      child: MyApp(),
    ),
  );
}

final _noScreenshot = NoScreenshot.instance;

Future<void> disableScreenshot() async {
  await _noScreenshot.screenshotOff();
}

Future<void> configureApp() async {
  SharedPreferences preferences = getIt<SharedPreferences>();
  String local =
      preferences.getString(Constants.localeKey) ?? Constants.enLocaleKey;
  bool isDark = preferences.getBool(Constants.themeKey) ?? true;
  getIt<AppConfigProvider>().changeLocal(local);
  getIt<AppConfigProvider>().changeTheme(
    isDark ? ThemeMode.dark : ThemeMode.light,
  );
  if (FirebaseAuth.instance.currentUser != null) {
    getIt<AppConfigProvider>().setUser(FirebaseAuth.instance.currentUser!);
  }
  await disableScreenshot();
}

var navigatorKey = GlobalKey<NavigatorState>();

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
      initialRoute:appConfigProvider.user != null ? AppRouts.home : AppRouts.onboarding,
      routes: {
        AppRouts.onboarding: (_) => OnboardingView(),
        AppRouts.actionSelection: (_) => ActionSelectionView(),
        AppRouts.login: (_) => const LoginView(),
        AppRouts.register: (context) => const RegisterView(),
        AppRouts.forgetPassword: (context) => const ForgetPasswordView(),
        AppRouts.home: (context) => const HomeView(),
      },
    );
  }
}
