import 'package:animate_do/animate_do.dart';
import 'package:chat_bot/core/constants/constants.dart';
import 'package:chat_bot/core/di/di.dart';
import 'package:chat_bot/core/extentions/number_ext.dart';
import 'package:chat_bot/core/l10n/translations/app_localizations.dart';
import 'package:chat_bot/core/providers/app_config_provider.dart';
import 'package:chat_bot/gen/assets.dart';
import 'package:chat_bot/presentation/onboarding/widgets/option_selection_widget.dart';
import 'package:flutter/material.dart';

class SettingsWidget extends StatefulWidget {
  final Function onFinish;

  const SettingsWidget({required this.onFinish, super.key});

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  AppConfigProvider appConfigProvider = getIt<AppConfigProvider>();

  bool isLanguageSelected = false;

  bool isThemeSelected = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) => FadeTransition(
            opacity: animation,
            child: child,
          ),
          child: appConfigProvider.isDark()
              ? Image.asset(
                  key: const Key("dark"),
                  Assets.onboardingDark,
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  key: const Key("light"),
                  Assets.onboardingLight,
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
        ),
        if (!isLanguageSelected)
          OptionSelectionWidget<String>(
            options: const [
              ("English", Constants.enLocaleKey),
              ("العربيه", Constants.arLocaleKey),
            ],
            groupValue: appConfigProvider.getLocal(),
            onOptionSelected: (value) => {
              _changeLocale(value),
            },
            title: AppLocalizations.of(context)!.selectLanguage,
            onDonePress: () {
              isLanguageSelected = true;
              setState(() {});
            },
          ),
        if (!isThemeSelected && isLanguageSelected)
          OptionSelectionWidget<ThemeMode>(
            options: [
              (AppLocalizations.of(context)!.light, ThemeMode.light),
              (AppLocalizations.of(context)!.dark, ThemeMode.dark),
            ],
            groupValue: appConfigProvider.getTheme(),
            onOptionSelected: (value) => {_changeTheme(value)},
            title: AppLocalizations.of(context)!.selectTheme,
            onDonePress: () {
              isThemeSelected = true;
              setState(() {});
            },
          ),
        if (isLanguageSelected && isThemeSelected)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SlideInUp(
                  child: ZoomIn(
                    child: Text(
                      AppLocalizations.of(context)!.welcomeMessage,
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                16.spaceVertical,
                SlideInUp(
                  child: ZoomIn(
                    child: FilledButton(
                        onPressed: () {widget.onFinish();},
                        child: Text(AppLocalizations.of(context)!.letsStart)),
                  ),
                )
              ],
            ),
          )
      ],
    );
  }

  void _changeLocale(String value) {
    appConfigProvider.changeLocal(value);
  }

  void _changeTheme(ThemeMode value) {
    appConfigProvider.changeTheme(value);
  }
}
