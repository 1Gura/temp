import 'package:equatable/equatable.dart';

import '../model/data_model.dart';

abstract class CubitStates extends Equatable {}

class InitialState extends CubitStates {
  @override
  List<Object> get props => [];
}

class WelcomeState extends CubitStates {
  @override
  List<Object> get props => [];
}

class RegistrationState extends CubitStates {
  final List<dynamic> errors;

  RegistrationState(this.errors);

  @override
  List<Object> get props => [errors];
}

class LoginState extends CubitStates {
  final List<dynamic> errors;

  LoginState(this.errors);

  @override
  List<Object> get props => [errors];
}

class RegistrationStateLoading extends CubitStates {
  @override
  List<Object> get props => [];
}

class LoadingState extends CubitStates {
  // final AuthModel auth;
  //
  // LoadingState(this.auth);

  @override
  List<Object> get props => [];
}

class LoadedState extends CubitStates {
  final List<DataModel> places;

  LoadedState(this.places);

  @override
  List<Object> get props => [places];
}

class DetailState extends CubitStates {
  final DataModel data;

  DetailState(this.data);

  @override
  List<Object> get props => [data];
}
