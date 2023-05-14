import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:temp/misc/colors.dart';
import 'package:temp/widgets/app_large_text.dart';
import 'package:temp/widgets/app_text.dart';

import '../widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "img-section-01.png",
    "img-section-02.png",
    "img-section-03.png",
  ];

  @override
  Widget build(BuildContext context) {
    var listText = [
      "Автоматизация \nторговли на бирже",
      "Наличие конструктора собственных торговых стратегий",
      "Минимальная комиссия 10% ТОЛЬКО с прибыли"
    ];
    var listTextDescribe = [
      "Обширный набор готовых торговых стратегий под любой инвестиционный профиль.",
      "Предоставление торговых роботов",
      "Уведомления об операциях"
    ];
    return Scaffold(
        body: PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: images.length,
            itemBuilder: (_, index) {
              return Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/img/" + images[index]),
                        fit: BoxFit.cover)),
                child: Container(
                  margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 300,
                            child: AppLargeText(text: listText[index], color: Colors.black87,),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 250,
                            child: AppText(
                              text: listTextDescribe[index],
                              color: Colors.black87,
                              size: 20,
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          ResponsiveButton(
                            text: "Войти",
                            width: 200,
                          )
                        ],
                      ),
                      Column(
                        children: List.generate(
                            3,
                            (indexDots) => Container(
                                  margin: const EdgeInsets.only(bottom: 2),
                                  width: 8,
                                  height: index == indexDots ? 25 : 8,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: index == indexDots
                                          ? Colors.white
                                          : Colors.white.withOpacity(0.6)),
                                )),
                      )
                    ],
                  ),
                ),
              );
            }));
  }
}
