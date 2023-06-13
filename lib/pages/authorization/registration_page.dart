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
      body: SingleChildScrollView(
        child: HeaderWidget(),
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();
  bool passToggle = true;

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
        }
        return Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  "username",
                  style: textStyle,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (text) {
                    username = text;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter password";
                    }
                    bool passwordValid = RegExp(r"^.{2,}$").hasMatch(value);
                    if (!passwordValid) {
                      return "Enter valid user";
                    }
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
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      suffix: InkWell(
                    onTap: () {
                      setState(() {
                        passToggle = !passToggle;
                      });
                    },
                    child: Icon(
                        passToggle ? Icons.visibility : Icons.visibility_off),
                  )),
                  controller: emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Email";
                    }
                    bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value);
                    if (!emailValid) {
                      return "Enter Valid Email";
                    }
                  },
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
                TextFormField(
                  obscureText: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      suffix: InkWell(
                    onTap: () {
                      setState(() {
                        passToggle = !passToggle;
                      });
                    },
                    child: Icon(
                        passToggle ? Icons.visibility : Icons.visibility_off),
                  )),
                  controller: passwordController,
                  onChanged: (text) {
                    password = text;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter password";
                    }
                    bool passwordValid = RegExp(r"^.{4,}$").hasMatch(value);
                    if (!passwordValid) {
                      return "Enter password";
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "repeat password",
                  style: textStyle,
                ),
                TextFormField(
                  obscureText: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      suffix: InkWell(
                    onTap: () {
                      setState(() {
                        passToggle = !passToggle;
                      });
                    },
                    child: Icon(
                        passToggle ? Icons.visibility : Icons.visibility_off),
                  )),
                  controller: repeatPasswordController,
                  onChanged: (text) {
                    repeatPassword = text;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter password";
                    }
                    bool passwordValid = RegExp(r"^.{4,}$").hasMatch(value);
                    if (!passwordValid) {
                      return "Enter password";
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
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
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
