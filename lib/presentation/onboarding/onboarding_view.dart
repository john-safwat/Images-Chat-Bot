import 'package:animate_do/animate_do.dart';
import 'package:chat_bot/core/l10n/translations/app_localizations.dart';
import 'package:chat_bot/presentation/onboarding/widgets/onboarding_pages.dart';
import 'package:chat_bot/presentation/onboarding/widgets/settings_widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  bool isSettingsConfigured = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isSettingsConfigured
          ? SlideInUp(
        child: ZoomIn(
              child: OnboardingPages(
                  pageContent: [
                    (
                      AppLocalizations.of(context)!.onBoardingTitle1,
                      AppLocalizations.of(context)!.onBoardingDesc1
                    ),
                    (
                      AppLocalizations.of(context)!.onBoardingTitle2,
                      AppLocalizations.of(context)!.onBoardingDesc2
                    ),
                    (
                      AppLocalizations.of(context)!.onBoardingTitle3,
                      AppLocalizations.of(context)!.onBoardingDesc3
                    ),
                  ],
                ),
            ),
          )
          : SettingsWidget(
              onFinish: () {
                isSettingsConfigured = true;
                setState(() {});
              },
            ),
    );
  }
}
