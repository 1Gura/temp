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

  void goAuth() async {
    emit(AuthorizationState(const []));
  }

  void registration(
    String name,
    String email,
    String password,
    String repeatPassword,
  ) async {
    try {
      auth =
          await authService.registration(name, email, password, repeatPassword);
      if (auth.success) {
        emit(LoadedState(auth));
      } else {
        print(auth.errors);
        emit(AuthorizationState(auth.errors));
      }
    } catch (e) {}
  }

  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      // emit(LoadedState());
    } catch (e) {}
  }

  detailPage(DataModel data) {
    emit(DetailState(data));
  }

  goHome() {
    // emit(LoadedState());
  }
}
