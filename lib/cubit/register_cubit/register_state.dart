part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {}

class RegisterErrorState extends RegisterState {
  final String error;

  RegisterErrorState(this.error);
}

class RegisterChangeVisibilityState extends RegisterState {}

class RegisterConfirmChangeVisibilityState extends RegisterState {}

class RegisterCreateSuccessState extends RegisterState {}

class RegisterCreateErrorState extends RegisterState {
  final String error;

  RegisterCreateErrorState(this.error);
}
