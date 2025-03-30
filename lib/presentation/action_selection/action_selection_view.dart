import 'package:animate_do/animate_do.dart';
import 'package:chat_bot/core/di/di.dart';
import 'package:chat_bot/core/extentions/number_ext.dart';
import 'package:chat_bot/core/l10n/translations/app_localizations.dart';
import 'package:chat_bot/core/providers/app_config_provider.dart';
import 'package:chat_bot/core/routes/app_routs.dart';
import 'package:chat_bot/gen/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class ActionSelectionView extends StatelessWidget {
  ActionSelectionView({super.key});

  AppConfigProvider appConfigProvider = getIt<AppConfigProvider>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SlideInUp(
            key: UniqueKey(),
            child: ZoomIn(
              key: UniqueKey(),
              child: Image.asset(
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
                appConfigProvider.isDark()
                    ? Assets.actionSelectionImageDark
                    : Assets.actionSelectionImageLight,
              ),
            ),
          ),
          Positioned.fill(
            child: FadeInUp(
              key: UniqueKey(),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Theme.of(context).colorScheme.secondary,
                    Theme.of(context)
                        .colorScheme
                        .secondary
                        .withValues(alpha: 0.2),
                    Colors.transparent
                  ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
                ),
                child: SafeArea(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SlideInUp(
                              key: UniqueKey(),
                              child: ZoomIn(
                                key: UniqueKey(),
                                child: SvgPicture.asset(
                                  Assets.appLogo,
                                  height: 160,
                                  // ignore: deprecated_member_use
                                  color: Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        SlideInUp(
                          key: UniqueKey(),
                          child: ZoomIn(
                            key: UniqueKey(),
                            child: Text(
                              textAlign: TextAlign.center,
                              AppLocalizations.of(context)!.youAreJustOneStepAway,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                        16.spaceVertical,
                        SlideInUp(
                          key: UniqueKey(),
                          child: ZoomIn(
                            key: UniqueKey(),
                            child: FilledButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(context, AppRouts.login);
                              },
                              child: Text(AppLocalizations.of(context)!.login),
                            ),
                          ),
                        ),
                        16.spaceVertical,
                        SlideInUp(
                          key: UniqueKey(),
                          child: ZoomIn(
                            key: UniqueKey(),
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, AppRouts.register);
                              },
                              child: Text(AppLocalizations.of(context)!.register),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
