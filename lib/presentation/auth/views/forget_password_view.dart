import 'package:animate_do/animate_do.dart';
import 'package:chat_bot/core/base/base_states.dart';
import 'package:chat_bot/core/di/di.dart';
import 'package:chat_bot/core/dialog/app_dialogs.dart';
import 'package:chat_bot/core/extentions/number_ext.dart';
import 'package:chat_bot/core/l10n/translations/app_localizations.dart';
import 'package:chat_bot/gen/assets.dart';
import 'package:chat_bot/presentation/auth/view_model/auth_states.dart';
import 'package:chat_bot/presentation/auth/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  AuthViewModel viewModel = getIt<AuthViewModel>();

  @override
  void dispose() {
    super.dispose();
    viewModel.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: viewModel,
      child: BlocListener<AuthViewModel, AuthStates>(
        listener: (context, state) {
          if (state.forgetPasswordState is BaseLoadingState) {
            AppDialogs.showLoading(
              message: AppLocalizations.of(context)!.sendingEmail,
              context: context,
            );
          } else if (state.forgetPasswordState is BaseSuccessState) {
            Navigator.pop(context);
            AppDialogs.showSuccessDialog(
              message: AppLocalizations.of(context)!.resetPasswordEmailSent,
              context: context,
              posActionTitle: AppLocalizations.of(context)!.ok,
              posAction: () {
                Navigator.pop(context);
              },
            );
          } else if (state.forgetPasswordState is BaseFailState) {
            Navigator.pop(context);
            AppDialogs.showFailDialog(
                message:
                    (state.registerState as BaseFailState).errorMessage ?? "",
                context: context,
                posActionTitle: AppLocalizations.of(context)!.tryAgain);
          }
        },
        child: Scaffold(
          key: UniqueKey(),
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.forget_password),
          ),
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              SlideInUp(
                child: ZoomIn(
                  child: Text(
                    AppLocalizations.of(context)!.forgetPasswordMessage,
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              32.spaceVertical,
              SlideInUp(
                child: ZoomIn(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        width: MediaQuery.of(context).size.width * 0.5,
                        Theme.of(context).brightness == Brightness.dark
                            ? Assets.botDark
                            : Assets.botLight,
                      ),
                    ],
                  ),
                ),
              ),
              32.spaceVertical,
              SlideInUp(
                child: ZoomIn(
                  child: TextFormField(
                    controller: viewModel.emailController,
                    keyboardType: TextInputType.emailAddress,
                    style: Theme.of(context).textTheme.titleSmall,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) =>
                        viewModel.validators.validateEmail(value),
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.email,
                      prefixIcon: const Icon(
                        Iconsax.sms_outline,
                      ),
                    ),
                  ),
                ),
              ),
              16.spaceVertical,
              SlideInUp(
                child: ZoomIn(
                  child: FilledButton(
                    onPressed: () {
                      viewModel.resetPassword();
                    },
                    child: Text(
                      AppLocalizations.of(context)!.resetPassword,
                    ),
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
