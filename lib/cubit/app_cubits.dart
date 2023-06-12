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
        .then((auth) async {
      if (auth.success) {
        emit(LoadingState());
        var places = data.getInfo(this.authService.token);
        emit(LoadedState(places as List<DataModel>));
      } else {
        emit(RegistrationState(auth.errors));
      }
    });
  }

  void login(
    String email,
    String password,
  ) {
    authService.login(email, password).then((auth) async {
      print("AUTH ${auth.success}");
      if (auth.success) {
        emit(LoadingState());
        var places = await data.getInfo(auth.token);
        emit(LoadedState(places));
      } else {
        emit(RegistrationState(auth.errors));
      }
    });
  }

  void getInfoAccounts() async {
    try {
      emit(LoadingState());
      var accounts = await investUsersService.getInfoUserAccounts();
      emit(BriefcaseState(accounts));
    } catch (e) {}
  }

  void getBriefcaseDetail(AccountModel account) async {
    try {
      emit(LoadingState());
      emit(BriefcaseDetailState(account));
    } catch (e) {}
  }

  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo(authService.token);
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
