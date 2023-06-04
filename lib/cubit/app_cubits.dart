import 'package:bloc/bloc.dart';
import 'package:temp/cubit/app_cubit_states.dart';
import 'package:temp/model/auth_model.dart';
import 'package:temp/services/auth_service.dart';
import 'package:temp/services/data_services.dart';

import '../model/data_model.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.data, required this.authService})
      : super(InitialState()) {
    emit(WelcomeState());
  }

  final DataServices data;
  final AuthService authService;
  late final places;
  late final AuthModel auth;

  void goRegistration() {
    emit(RegistrationState(const []));
  }

  void goLogin() {
    emit(LoginState(const []));
  }

  void registration(
    String name,
    String email,
    String password,
    String repeatPassword,
  ) {
    authService
        .registration(name, email, password, repeatPassword)
        .then((auth) {
      if (auth.success) {
        emit(LoadingState());
        data.getInfo().then((places) {
          emit(LoadedState(places));
        });
      } else {
        print(auth.errors);
        emit(RegistrationState(auth.errors));
      }
    });
  }

  void login(
    String email,
    String password,
  ) {
    authService.login(email, password).then((auth) {
      if (auth.success) {
        emit(LoadingState());
        data.getInfo().then((places) {
          emit(LoadedState(places));
        });
      } else {
        print(auth.errors);
        emit(RegistrationState(auth.errors));
      }
    });
  }

  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    } catch (e) {}
  }

  detailPage(DataModel data) {
    emit(DetailState(data));
  }

  goHome() {
    // emit(LoadedState());
  }
}
