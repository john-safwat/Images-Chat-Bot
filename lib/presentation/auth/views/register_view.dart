import 'package:animate_do/animate_do.dart';
import 'package:chat_bot/core/base/base_states.dart';
import 'package:chat_bot/core/di/di.dart';
import 'package:chat_bot/core/dialog/app_dialogs.dart';
import 'package:chat_bot/core/extentions/number_ext.dart';
import 'package:chat_bot/core/l10n/translations/app_localizations.dart';
import 'package:chat_bot/core/widgets/language_switch.dart';
import 'package:chat_bot/gen/assets.dart';
import 'package:chat_bot/presentation/auth/view_model/auth_states.dart';
import 'package:chat_bot/presentation/auth/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:icons_plus/icons_plus.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  AuthViewModel viewModel = getIt<AuthViewModel>();

  bool isObscure = true;
  bool isConfirmObscure = true;

  @override
  void dispose() {
    super.dispose();
    viewModel.clear();
    viewModel.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: viewModel,
      child: BlocListener<AuthViewModel, AuthStates>(
        listener: (context, state) {
          if (state.registerState is BaseLoadingState) {
            AppDialogs.showLoading(
              message: AppLocalizations.of(context)!.creatingAccount,
              context: context,
            );
          } else if (state.registerState is BaseSuccessState) {
            Navigator.pop(context);
            AppDialogs.showSuccessDialog(
              message: AppLocalizations.of(context)!.creatingAccount,
              context: context,
              posActionTitle: AppLocalizations.of(context)!.ok,
              posAction: () {
                Navigator.pop(context);
              },
            );
          } else if (state.registerState is BaseFailState) {
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
          body: SafeArea(
            child: Form(
              key: viewModel.registrationFormKey,
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SlideInUp(
                        child: ZoomIn(
                          child: SvgPicture.asset(
                            Assets.appLogo,
                            height: 160,
                            // ignore: deprecated_member_use
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  32.spaceVertical,
                  SlideInUp(
                    child: ZoomIn(
                      child: TextFormField(
                        controller: viewModel.nameController,
                        keyboardType: TextInputType.name,
                        style: Theme.of(context).textTheme.titleSmall,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) =>
                            viewModel.validators.validateName(value),
                        decoration: InputDecoration(
                          hintText: AppLocalizations.of(context)!.name,
                          prefixIcon: const Icon(
                            Iconsax.user_outline,
                          ),
                        ),
                      ),
                    ),
                  ),
                  16.spaceVertical,
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
                      child: TextFormField(
                        style: Theme.of(context).textTheme.titleSmall,
                        controller: viewModel.passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) =>
                            viewModel.validators.validatePassword(value),
                        obscureText: isObscure,
                        decoration: InputDecoration(
                          hintText: AppLocalizations.of(context)!.password,
                          prefixIcon: const Icon(Iconsax.lock_outline),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isObscure = !isObscure;
                              });
                            },
                            child: Icon(isObscure
                                ? Iconsax.eye_slash_outline
                                : Iconsax.eye_outline),
                          ),
                        ),
                      ),
                    ),
                  ),
                  16.spaceVertical,
                  SlideInUp(
                    child: ZoomIn(
                      child: TextFormField(
                        style: Theme.of(context).textTheme.titleSmall,
                        controller: viewModel.passwordConfirmationController,
                        keyboardType: TextInputType.visiblePassword,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) =>
                            viewModel.validators.validateConfirmPassword(
                          value,
                          viewModel.passwordController.text,
                        ),
                        obscureText: isConfirmObscure,
                        decoration: InputDecoration(
                          hintText: AppLocalizations.of(context)!.rePassword,
                          prefixIcon: const Icon(Iconsax.lock_outline),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isConfirmObscure = !isConfirmObscure;
                              });
                            },
                            child: Icon(isConfirmObscure
                                ? Iconsax.eye_slash_outline
                                : Iconsax.eye_outline),
                          ),
                        ),
                      ),
                    ),
                  ),
                  32.spaceVertical,
                  SlideInUp(
                    child: ZoomIn(
                      child: FilledButton(
                        onPressed: () {
                          viewModel.register();
                        },
                        child: Text(
                          AppLocalizations.of(context)!.register,
                        ),
                      ),
                    ),
                  ),
                  16.spaceVertical,
                  SlideInUp(
                    child: ZoomIn(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.alreadyHaveAccount,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(AppLocalizations.of(context)!.login),
                          ),
                        ],
                      ),
                    ),
                  ),
                  16.spaceVertical,
                  SlideInUp(
                    child: ZoomIn(
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LanguageSwitch(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
