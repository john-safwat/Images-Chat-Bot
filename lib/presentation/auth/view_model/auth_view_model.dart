import 'package:chat_bot/core/base/base_states.dart';
import 'package:chat_bot/core/base/base_view_model.dart';
import 'package:chat_bot/core/datasource_execution/results.dart';
import 'package:chat_bot/core/providers/app_config_provider.dart';
import 'package:chat_bot/core/utils/exception_handler.dart';
import 'package:chat_bot/core/utils/validators.dart';
import 'package:chat_bot/data/datasource/auth_remote_datasource.dart';
import 'package:chat_bot/presentation/auth/view_model/auth_states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthViewModel extends BaseViewModel<AuthStates> {
  final AppConfigProvider configProvider;
  final Validators validators;
  final AuthRemoteDatasource authRemoteDatasource;

  AuthViewModel(this.configProvider, this.validators, this.authRemoteDatasource)
      : super(AuthStates());

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> registrationFormKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  TextEditingController nameController = TextEditingController();

  clear() {
    emailController.clear();
    passwordController.clear();
    passwordConfirmationController.clear();
    nameController.clear();
  }

  Future<void> register() async {
    if (registrationFormKey.currentState!.validate()) {
      emit(state.copyWith(registerState: const BaseLoadingState()));
      var response = await authRemoteDatasource.register(
        emailController.text,
        passwordController.text,
        nameController.text,
      );
      switch (response) {
        case Success<User>():
          {
            clear();
            emit(state.copyWith(
                registerState: BaseSuccessState<User>(response.data)));
          }
        case Failure<User>():
          {
            emit(
              state.copyWith(
                registerState: BaseFailState(
                  mapExceptionToErrorMessage(response.exception),
                ),
              ),
            );
          }
      }
    }
  }

  Future<void> login() async {
    if (loginFormKey.currentState!.validate()) {
      emit(state.copyWith(loginState: const BaseLoadingState()));
      var response = await authRemoteDatasource.login(
        emailController.text,
        passwordController.text,
      );
      switch (response) {
        case Success<User>():
          {
            clear();
            emit(state.copyWith(
                loginState: BaseSuccessState<User>(response.data)));
          }
        case Failure<User>():
          {
            emit(
              state.copyWith(
                loginState: BaseFailState(
                  mapExceptionToErrorMessage(response.exception),
                ),
              ),
            );
          }
      }
    }
  }

  Future<void> googleLogin() async {
    emit(state.copyWith(loginState: const BaseLoadingState()));
    var response = await authRemoteDatasource.googleLogin();
    switch (response) {
      case Success<User>():
        {
          clear();
          emit(state.copyWith(
              loginState: BaseSuccessState<User>(response.data)));
        }
      case Failure<User>():
        {
          emit(
            state.copyWith(
              loginState: BaseFailState(
                mapExceptionToErrorMessage(response.exception),
              ),
            ),
          );
        }
    }
  }

  Future<void> resetPassword() async {
    if (validators.validateEmail(emailController.text) == null) {
      emit(state.copyWith(forgetPasswordState: const BaseLoadingState()));
      var response = await authRemoteDatasource.sendPasswordResetEmail(
        emailController.text,
      );
      switch (response) {
        case Success<bool>():
          {
            clear();
            emit(state.copyWith(
                forgetPasswordState: BaseSuccessState<bool>(response.data)));
          }
        case Failure<bool>():
          {
            emit(
              state.copyWith(
                forgetPasswordState: BaseFailState(
                  mapExceptionToErrorMessage(response.exception),
                ),
              ),
            );
          }
      }
    }
  }
}
