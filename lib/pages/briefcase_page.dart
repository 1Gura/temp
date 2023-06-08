import 'package:flutter/cupertino.dart';

class BriefcasePage extends StatefulWidget {
  const BriefcasePage({Key? key}) : super(key: key);

  @override
  State<BriefcasePage> createState() => _BriefcasePageState();
}

class _BriefcasePageState extends State<BriefcasePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Briefcase"),
    );
  }
}
