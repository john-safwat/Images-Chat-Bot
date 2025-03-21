import 'package:chat_bot/core/constants/constants.dart';
import 'package:chat_bot/core/di/di.dart';
import 'package:chat_bot/core/extentions/number_ext.dart';
import 'package:chat_bot/core/l10n/translations/app_localizations.dart';
import 'package:chat_bot/core/providers/app_config_provider.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appName),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(),
          FilledButton(
            onPressed: () {
              getIt<AppConfigProvider>().changeTheme(
                getIt<AppConfigProvider>().isDark()
                    ? ThemeMode.light
                    : ThemeMode.dark,
              );
            },
            child: const Text("theme"),
          ),
          16.spaceVertical,
          FilledButton(
            onPressed: () {
              getIt<AppConfigProvider>().changeLocal(
                getIt<AppConfigProvider>().isEn()
                    ? Constants.arLocaleKey
                    : Constants.enLocaleKey,
              );
            },
            child: const Text("locale"),
          ),
        ],
      ),
    );
  }
}
