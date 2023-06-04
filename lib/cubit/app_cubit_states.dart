import 'package:equatable/equatable.dart';
import 'package:temp/model/auth_model.dart';

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

class AuthorizationState extends CubitStates {
  final List<dynamic> errors;

  AuthorizationState(this.errors);

  @override
  List<Object> get props => [errors];
}

class RegistrationState extends CubitStates {
  @override
  List<Object> get props => [];
}

class LoadingState extends CubitStates {
  @override
  List<Object> get props => [];
}

class LoadedState extends CubitStates {
  final AuthModel auth;

  LoadedState(this.auth);

  @override
  List<Object> get props => [auth];
}

class DetailState extends CubitStates {
  final DataModel data;

  DetailState(this.data);

  @override
  List<Object> get props => [data];
}
