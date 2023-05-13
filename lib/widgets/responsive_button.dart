import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:temp/widgets/app_large_text.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  String text;

  ResponsiveButton({Key? key, this.width, this.isResponsive = false, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppLargeText(text: text, color: Colors.black,)
        ],
      ),
    );
  }
}
