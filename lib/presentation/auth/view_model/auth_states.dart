import 'package:chat_bot/core/base/base_states.dart';

class AuthStates {
  BaseState? loginState;
  BaseState? registerState;
  BaseState? forgetPasswordState;

  AuthStates({this.loginState, this.registerState, this.forgetPasswordState});

  AuthStates copyWith({
    BaseState? loginState,
    BaseState? registerState,
    BaseState? forgetPasswordState,
  }) {
    return AuthStates(
      loginState: loginState ?? this.loginState,
      registerState: registerState ?? this.registerState,
      forgetPasswordState: forgetPasswordState ?? this.forgetPasswordState,
    );
  }
}
