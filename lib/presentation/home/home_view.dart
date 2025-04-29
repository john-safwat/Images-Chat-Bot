import 'package:chat_bot/core/di/di.dart';
import 'package:chat_bot/core/l10n/translations/app_localizations.dart';
import 'package:chat_bot/core/providers/app_config_provider.dart';
import 'package:chat_bot/core/theme/app_colors.dart';
import 'package:chat_bot/presentation/home/widgets/home_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:lottie/lottie.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Imagine.Ai"),
      ),
      drawer: const HomeDrawerWidget(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset("assets/animations/bot.json"),
                  Text(
                    AppLocalizations.of(context)!.homeScreenMessage,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                style: Theme.of(context).textTheme.titleSmall,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.message,
                  filled: true,
                  fillColor: getIt<AppConfigProvider>().isDark()
                      ? AppColors.gray
                      : AppColors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      width: 1,
                      color: getIt<AppConfigProvider>().isDark()
                          ? AppColors.gray
                          : AppColors.blue,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      width: 1,
                      color: getIt<AppConfigProvider>().isDark()
                          ? AppColors.gray
                          : AppColors.blue,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      width: 1,
                      color: getIt<AppConfigProvider>().isDark()
                          ? AppColors.gray
                          : AppColors.blue,
                    ),
                  ),
                  suffixIcon: const Icon(Iconsax.send_1_outline),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
