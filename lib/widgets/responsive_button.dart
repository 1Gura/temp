import 'package:flutter/material.dart';
import 'package:temp/misc/colors.dart';
import 'package:temp/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  String text;
  double fontSize;

  ResponsiveButton(
      {Key? key,
      this.width = 220,
      this.isResponsive = false,
      this.fontSize = 20,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive == true ? double.maxFinite : width,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.textColorPurple),
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: isResponsive == true
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center,
            children: [
              text.length > 0
                  ? Container(
                      child: AppText(
                      text: text,
                      color: Colors.white,
                      size: fontSize,
                    ))
                  : Container(),
              const Icon(
                Icons.call_missed_outgoing,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
