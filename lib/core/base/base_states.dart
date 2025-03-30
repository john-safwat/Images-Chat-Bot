sealed class BaseState<T> {
  final T? data;

  const BaseState({this.data});
}

class BaseInitialState<T> extends BaseState<T> {
  const BaseInitialState();
}

class BaseLoadingState<T> extends BaseState<T> {
  const BaseLoadingState();
}

class BaseSuccessState<T> extends BaseState<T> {
  const BaseSuccessState(T? data) : super(data: data);
}

class BaseFailState extends BaseState {
  final String? errorMessage;
  final Exception? exception;

  const BaseFailState([this.errorMessage, this.exception]);
}
