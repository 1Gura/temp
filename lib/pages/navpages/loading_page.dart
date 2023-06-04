import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    // return BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
    return const Center(
      child: CircularProgressIndicator(),
    );
    // });
  }
}
