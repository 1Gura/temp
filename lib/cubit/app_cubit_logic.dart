import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temp/cubit/app_cubit_states.dart';
import 'package:temp/cubit/app_cubits.dart';
import 'package:temp/pages/authorization/login_page.dart';
import 'package:temp/pages/authorization/registration_page.dart';
import 'package:temp/pages/briefcase_detail_page.dart';
import 'package:temp/pages/briefcase_page.dart';
import 'package:temp/pages/detail_page.dart';
import 'package:temp/pages/navpages/main_page.dart';
import 'package:temp/pages/welcome_page.dart';

import '../pages/navpages/loading_page.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({Key? key}) : super(key: key);

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is WelcomeState) {
            return const WelcomePage();
          }
          if (state is RegistrationState) {
            return const RegistrationPage();
          }
          if (state is LoginState) {
            return const LoginPage();
          }
          if (state is RegistrationStateLoading) {
            return const LoadingPage();
          }
          if (state is BriefcaseState) {
            return const BriefcasePage();
          }
          if (state is BriefcaseDetailState) {
            return const BriefcaseDetailPage();
          }
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is LoadedState) {
            return const MainPage();
          }
          if (state is DetailState) {
            return DetailPage();
          }
          return Container();
        },
      ),
    );
  }
}
