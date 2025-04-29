import 'package:animate_do/animate_do.dart';
import 'package:chat_bot/core/extentions/number_ext.dart';
import 'package:chat_bot/core/l10n/translations/app_localizations.dart';
import 'package:chat_bot/core/theme/app_colors.dart';
import 'package:chat_bot/core/widgets/language_switch.dart';
import 'package:chat_bot/core/widgets/theme_switch.dart';
import 'package:flutter/material.dart';

class HomeDrawerWidget extends StatelessWidget {
  const HomeDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SlideInUp(
                child: ZoomIn(
                  child: Text(
                    AppLocalizations.of(context)!.chats,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
              SlideInUp(child: ZoomIn(child: const Divider())),
              const Spacer(),
              SlideInUp(child: ZoomIn(child: const Divider())),
              8.spaceVertical,
              SlideInUp(
                child: ZoomIn(
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          AppLocalizations.of(context)!.language,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      const LanguageSwitch(),
                    ],
                  ),
                ),
              ),
              16.spaceVertical,
              SlideInUp(
                child: ZoomIn(
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          AppLocalizations.of(context)!.theme,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      const ThemeSwitch(),
                    ],
                  ),
                ),
              ),
              16.spaceVertical,
              SlideInUp(
                child: ZoomIn(
                  child: FilledButton(
                    onPressed: () {},
                    style: FilledButton.styleFrom(
                        backgroundColor: AppColors.red,
                        foregroundColor: AppColors.white),
                    child: Text(
                      AppLocalizations.of(context)!.logout,
                    ),
                  ),
                ),
              ),
              8.spaceVertical,
              SlideInUp(
                child: ZoomIn(
                  child: const Divider(),
                ),
              ),
              8.spaceVertical,
              SlideInUp(
                child: ZoomIn(
                  child: FilledButton(
                    onPressed: () {},
                    child: Text(AppLocalizations.of(context)!.newChat),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
