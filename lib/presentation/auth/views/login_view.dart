import 'package:animate_do/animate_do.dart';
import 'package:chat_bot/core/base/base_states.dart';
import 'package:chat_bot/core/di/di.dart';
import 'package:chat_bot/core/dialog/app_dialogs.dart';
import 'package:chat_bot/core/extentions/number_ext.dart';
import 'package:chat_bot/core/l10n/translations/app_localizations.dart';
import 'package:chat_bot/core/routes/app_routs.dart';
import 'package:chat_bot/core/widgets/language_switch.dart';
import 'package:chat_bot/gen/assets.dart';
import 'package:chat_bot/presentation/auth/view_model/auth_states.dart';
import 'package:chat_bot/presentation/auth/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:icons_plus/icons_plus.dart';

class LoginView<VM extends Cubit, S> extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  AuthViewModel viewModel = getIt<AuthViewModel>();

  bool isObscure = true;

  @override
  void dispose() {
    super.dispose();
    viewModel.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: viewModel,
      child: BlocListener<AuthViewModel , AuthStates>(
        listener: (context, state) {
          if (state.loginState is BaseLoadingState) {
            AppDialogs.showLoading(
              message: AppLocalizations.of(context)!.loggingIn,
              context: context,
            );
          } else if (state.loginState is BaseSuccessState) {
            Navigator.pop(context);
            AppDialogs.showSuccessDialog(
              message: AppLocalizations.of(context)!.loginSuccess,
              context: context,
              posActionTitle: AppLocalizations.of(context)!.ok,
              posAction: () {
                Navigator.pop(context);
              },
            );
          } else if (state.loginState is BaseFailState) {
            Navigator.pop(context);
            AppDialogs.showFailDialog(
                message:
                (state.loginState as BaseFailState).errorMessage ?? "",
                context: context,
                posActionTitle: AppLocalizations.of(context)!.tryAgain);
          }
        },
        child: Scaffold(
          key: UniqueKey(),
          body: SafeArea(
            child: Form(
              key: viewModel.loginFormKey,
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
                  8.spaceVertical,
                  SlideInUp(
                    child: ZoomIn(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, AppRouts.forgetPassword);
                            },
                            child: Text(
                              AppLocalizations.of(context)!.forget_password,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  8.spaceVertical,
                  SlideInUp(
                    child: ZoomIn(
                      child: FilledButton(
                        onPressed: () {
                          viewModel.login();
                        },
                        child: Text(
                          AppLocalizations.of(context)!.login,
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
                            AppLocalizations.of(context)!.dont_have_account,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, AppRouts.register , arguments: viewModel);
                            },
                            child: Text(AppLocalizations.of(context)!.create_account),
                          ),
                        ],
                      ),
                    ),
                  ),
                  16.spaceVertical,
                  SlideInUp(
                    child: ZoomIn(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Expanded(
                            child: Divider(
                              endIndent: 8,
                              indent: 40,
                            ),
                          ),
                          Text(
                            AppLocalizations.of(context)!.or,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const Expanded(
                            child: Divider(
                              endIndent: 40,
                              indent: 8,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  24.spaceVertical,
                  SlideInUp(
                    child: ZoomIn(
                      child: FilledButton.icon(
                        onPressed: () {
                          viewModel.googleLogin();
                        },
                        icon: Brand(
                          Brands.google,
                          size: 28,
                        ),
                        label: Text(AppLocalizations.of(context)!.login_with_google),
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
