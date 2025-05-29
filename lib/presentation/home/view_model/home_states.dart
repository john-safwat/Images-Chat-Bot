import 'package:chat_bot/core/base/base_states.dart';

class HomeStates {
  BaseState? sendMessageState;

  HomeStates({this.sendMessageState});

  HomeStates copyWith({
    BaseState? sendMessageState,
  }) {
    return HomeStates(
      sendMessageState: sendMessageState ?? this.sendMessageState,
    );
  }
}
