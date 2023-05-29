import 'package:flutter/material.dart';

import '../../misc/colors.dart';

class AuthorizationPage extends StatefulWidget {
  const AuthorizationPage({Key? key}) : super(key: key);

  @override
  State<AuthorizationPage> createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
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
  const HeaderWidget({Key? key}) : super(key: key);

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
        Text("Если у вас уже есть аккаунт"),
        Text("Нажми здесь")
      ],
    );
  }
}

class FormWidget extends StatefulWidget {
  const FormWidget({Key? key}) : super(key: key);

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  @override
  Widget build(BuildContext context) {
    final textStyle =
        const TextStyle(fontSize: 20, color: AppColors.textColorPurple);
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          Text(
            "username",
            style: textStyle,
          ),
          TextField(),
          SizedBox(
            height: 10,
          ),
          Text(
            "email",
            style: textStyle,
          ),
          TextField(),
          SizedBox(
            height: 10,
          ),
          Text(
            "password",
            style: textStyle,
          ),
          TextField(),
          SizedBox(
            height: 10,
          ),
          Text(
            "repeat password",
            style: textStyle,
          ),
          TextField(),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
