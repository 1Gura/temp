import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temp/cubit/app_cubit_states.dart';

import '../cubit/app_cubits.dart';
import '../misc/colors.dart';
import '../model/account_model.dart';
import '../widgets/app_large_text.dart';
import '../widgets/app_text.dart';
import '../widgets/responsive_button.dart';
import '../widgets/simple_button.dart';

class BriefcaseDetailPage extends StatefulWidget {
  const BriefcaseDetailPage({Key? key}) : super(key: key);

  @override
  State<BriefcaseDetailPage> createState() => _BriefcaseDetailPageState();
}

class _BriefcaseDetailPageState extends State<BriefcaseDetailPage> {
  var money = [511234.44, 14421.44, 3145.21, 13764.2, 15666.6];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      if (state is BriefcaseDetailState) {
        AccountModel account = state.account as AccountModel;
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
                            BlocProvider.of<AppCubits>(context)
                                .getInfoAccounts();
                          },
                          icon: const Icon(Icons.arrow_back),
                          color: Colors.black,
                        )
                      ],
                    )),
                Positioned(
                    top: 100,
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 30),
                      width: MediaQuery.of(context).size.width,
                      height: 500,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppLargeText(
                                text: account.name,
                                color: Colors.black87,
                              ),
                              AppLargeText(
                                text: "${money[0]} ₽",
                                color: AppColors.textColorPurple,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Icon(Icons.auto_graph_outlined),
                              const SizedBox(
                                width: 5,
                              ),
                              AppText(
                                text: "Доход с момента подключения(12.06.2023)",
                                color: Colors.deepPurple,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              AppText(
                                text: "${money[3]} ₽",
                                color: money[3] > 0 ? Colors.green : Colors.red,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    AppColors.textColorPurple,
                                    Colors.red,
                                  ],
                                )),
                            child: Column(
                              children: [
                                AppLargeText(
                                  text: "Аналитика",
                                  color: Colors.black87,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                AppText(
                                  text: "Портфель, баланс, прогнозы",
                                  color: Colors.black54,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          AppLargeText(
                            text: "Список активовов",
                            color: Colors.black.withOpacity(0.8),
                            size: 26,
                          ),
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Icon(Icons.cases_rounded),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      AppText(
                                        text: "Яндекс",
                                        color: AppColors.textColorPurple,
                                      ),
                                      const SizedBox(
                                        width: 30,
                                      ),
                                      AppText(
                                          text: "Количество:20",
                                          color: AppColors.textColorPurple),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Icon(Icons.cases_rounded),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      AppText(
                                        text: "Тинькофф",
                                        color: AppColors.textColorPurple,
                                      ),
                                      const SizedBox(
                                        width: 30,
                                      ),
                                      AppText(
                                          text: "Количество:20",
                                          color: AppColors.textColorPurple),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Icon(Icons.cases_rounded),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      AppText(
                                        text: "Сбер",
                                        color: AppColors.textColorPurple,
                                      ),
                                      const SizedBox(
                                        width: 30,
                                      ),
                                      AppText(
                                          text: "Количество:5",
                                          color: AppColors.textColorPurple),
                                    ],
                                  ),
                                ),
                              ],
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
          child: Text("Портфель не был загружен"),
        );
      }
    });
  }
}
