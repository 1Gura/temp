import 'package:bloc/bloc.dart';
import 'package:temp/cubit/app_cubit_states.dart';
import 'package:temp/model/account_model.dart';
import 'package:temp/model/auth_model.dart';
import 'package:temp/services/auth_service.dart';
import 'package:temp/services/data_services.dart';

import '../model/data_model.dart';
import '../services/invest_users_service.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits(
      {required this.data,
      required this.authService,
      required this.investUsersService})
      : super(InitialState()) {
    emit(WelcomeState());
  }

  final DataServices data;
  final AuthService authService;
  final InvestUsersService investUsersService;
  late final AuthModel auth;
  late List<DataModel> places;
  late List<AccountModel> accounts;

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

  void getInfoAccounts() async {
    try {
      emit(LoadingState());
      var value = await Future.wait(
          [data.getInfo(), investUsersService.getInfoUserAccounts()]);
      // emit(BriefcaseState(accounts));
      List<DataModel> places = value[0] as List<DataModel>;
      List<AccountModel> accounts = value[1] as List<AccountModel>;
      emit(LoadedState(places, accounts));
    } catch (e) {}
  }

  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    } catch (e) {}
  }

  detailPage(DataModel data) async {
    emit(DetailState(data));
  }

  goHome() {
    emit(LoadedState(places));
  }
}
