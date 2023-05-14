import 'package:flutter/cupertino.dart';

class BarItemPage extends StatelessWidget {
  const BarItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Text("BarItemPage")],
      ),
    );
  }
}
