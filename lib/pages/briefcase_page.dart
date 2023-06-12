import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temp/cubit/app_cubit_states.dart';
import 'package:temp/cubit/app_cubits.dart';
import 'package:temp/widgets/app_text.dart';

import '../misc/colors.dart';
import '../widgets/app_large_text.dart';
import '../widgets/responsive_button.dart';
import '../widgets/simple_button.dart';

class BriefcasePage extends StatefulWidget {
  const BriefcasePage({Key? key}) : super(key: key);

  @override
  State<BriefcasePage> createState() => _BriefcasePageState();
}

class _BriefcasePageState extends State<BriefcasePage> {
  var images = {
    "img-section-01.png": "Section1",
    "img-section-02.png": "Section2",
    "img-section-03.png": "Section3",
    "img-section-04.png": "Section4",
    "img-section-05.png": "Section5",
  };

  var money = [511234.44, 14421.44, 3145.21, 13764.2, 15666.6];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is BriefcaseState) {
            var accounts = state.accounts;
            print(accounts);
            return Scaffold(
              body: Container(
                width: double.maxFinite,
                height: double.maxFinite,
                child: Stack(
                  children: [
                    Positioned(
                        left: 0,
                        right: 0,
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  //TODO NetworkImage change
                                  image: AssetImage("assets/img/konvert.jpg"),
                                  fit: BoxFit.cover)),
                        )),
                    Positioned(
                        left: 20,
                        top: 50,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                BlocProvider.of<AppCubits>(context).getData();
                              },
                              icon: const Icon(Icons.arrow_back),
                              color: Colors.black,
                            )
                          ],
                        )),
                    Positioned(
                        top: 100,
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 30),
                          width: MediaQuery.of(context).size.width,
                          height: 600,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AppLargeText(
                                    text: "Список портфелей/счетов",
                                    color: Colors.black87,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 20),
                                height: 300,
                                width: double.maxFinite,
                                child: ListView.builder(
                                  itemCount: accounts.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                      onTap: () {
                                        print(accounts[index]);
                                        BlocProvider.of<AppCubits>(context)
                                            .getBriefcaseDetail(
                                                accounts[index]);
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            right: 15, top: 10),
                                        width: 200,
                                        height: 300,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            gradient: LinearGradient(
                                              begin: Alignment.topRight,
                                              end: Alignment.bottomLeft,
                                              colors: [
                                                AppColors.textColorPurple,
                                                Colors.red,
                                              ],
                                            )),
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              AppLargeText(
                                                  text: accounts[index].name,
                                                  color: AppColors.textColor1,
                                                  size: 30),
                                              AppText(
                                                text: "${money[index]} ₽",
                                                color: Colors.green,
                                              ),
                                              AppText(
                                                text: "Статус: Открыт",
                                                color: Colors.black,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        )),
                    Positioned(
                        bottom: 20,
                        left: 20,
                        right: 20,
                        child: Row(
                          children: [
                            SimpleButton(
                              color: AppColors.textColorPurple,
                              backgroundColor: Colors.white,
                              size: 60,
                              borderColor: AppColors.textColorPurple,
                              isIcon: true,
                              icon: Icons.favorite_border,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            ResponsiveButton(
                              text: "Go!",
                              isResponsive: true,
                            )
                          ],
                        ))
                  ],
                ),
              ),
            );
          } else {
            return Container(
              child: Text("Ошибка в предоставлении информации по портфелю"),
            );
          }
        },
      ),
    );
  }
}
