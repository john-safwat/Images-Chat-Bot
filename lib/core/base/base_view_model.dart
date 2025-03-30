import 'package:flutter_bloc/flutter_bloc.dart';

class BaseAction{}


abstract class BaseViewModel<T> extends Cubit<T>{
  BaseViewModel(super.initialState);
}