import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temp/cubit/app_cubit_states.dart';

import '../../cubit/app_cubits.dart';
import '../../misc/colors.dart';
import '../../widgets/app_large_text.dart';
import '../../widgets/responsive_button.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.textColorPurple,
        title: Text("Login to your account"),
      ),
      body: ListView(
        children: [HeaderWidget()],
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        FormWidget(),
        SizedBox(
          height: 50,
        ),
        AppLargeText(
          text: "Если у вас уже есть аккаунт",
          color: Colors.black87,
          size: 20,
        ),
        GestureDetector(
            onTap: () {
              BlocProvider.of<AppCubits>(context).goLogin();
            },
            child: ResponsiveButton(text: "Нажми здесь"))
      ],
    );
  }
}

class FormWidget extends StatefulWidget {
  FormWidget({Key? key}) : super(key: key);

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  late String username;

  late String email;

  late String password;

  late String repeatPassword;

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(fontSize: 20, color: AppColors.textColorPurple);
    return BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state) {
        List<dynamic> errors = [];
        if (state is RegistrationState) {
          errors = state.errors;
          print(errors);
        }
        return Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              Text(
                "username",
                style: textStyle,
              ),
              TextField(
                onChanged: (text) {
                  username = text;
                },
                decoration: InputDecoration(border: UnderlineInputBorder()),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "email",
                style: textStyle,
              ),
              TextField(
                onChanged: (text) {
                  email = text;
                },
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "password",
                style: textStyle,
              ),
              TextField(
                onChanged: (text) {
                  password = text;
                },
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "repeat password",
                style: textStyle,
              ),
              TextField(
                onChanged: (text) {
                  repeatPassword = text;
                },
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        BlocProvider.of<AppCubits>(context).registration(
                          username,
                          email,
                          password,
                          repeatPassword,
                        );
                      },
                      child: SizedBox(
                        height: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ResponsiveButton(
                              text: 'Регистрация',
                              isResponsive: false,
                            ),
                            errors.isNotEmpty
                                ? SizedBox(
                                    height: 100,
                                    child: Row(children: [
                                      AppLargeText(
                                        text: errors[0],
                                        color: Colors.red,
                                      )
                                    ]),
                                  )
                                : const SizedBox(
                                    height: 100,
                                  ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}