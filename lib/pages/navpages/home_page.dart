import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temp/cubit/app_cubit_states.dart';
import 'package:temp/cubit/app_cubits.dart';
import 'package:temp/misc/colors.dart';
import 'package:temp/pages/briefcase_page.dart';

import '../../widgets/app_large_text.dart';
import '../../widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    "img-section-01.png": "Section1",
    "img-section-02.png": "Section2",
    "img-section-03.png": "Section3",
    "img-section-04.png": "Section4",
    "img-section-05.png": "Section5",
  };

  @override
  Widget build(BuildContext context) {
    var tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is LoadedState) {
            var info = state.places;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 70, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.menu,
                        size: 30,
                        color: Colors.black54,
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 20),
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.withOpacity(0.5)),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: AppLargeText(
                    text: "Discover",
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //tabBar
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                        onTap: (current) {
                          if (current == 1) {}
                        },
                        labelPadding:
                            const EdgeInsets.only(left: 20, right: 20),
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        isScrollable: true,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicator: CircleTabIndicator(
                            color: AppColors.textColorPurple, radius: 4),
                        controller: tabController,
                        tabs: [
                          Tab(text: "Информация по счету"),
                          Tab(text: "Стратегии"),
                          Tab(text: "Другое"),
                        ]),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  height: 300,
                  width: double.maxFinite,
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      ListView.builder(
                        itemCount: info.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              if (info[index].title == 'Портфели') {
                                BlocProvider.of<AppCubits>(context)
                                    .getInfoAccounts();
                              } else {
                                BlocProvider.of<AppCubits>(context)
                                    .detailPage(info[index]);
                              }
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 15, top: 10),
                              width: 200,
                              height: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                image: DecorationImage(
                                  image: /*NetworkImage()*/
                                      //TODO заменить на получение картинки с API когда оно появится
                                      AssetImage("assets/img/" +
                                          images.keys.elementAt(index)),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Center(
                                child: AppLargeText(
                                    text: info[index].title,
                                    color: AppColors.textColorPurple,
                                    size: 30),
                              ),
                            ),
                          );
                        },
                      ),
                      BriefcasePage(),
                      Text("Three"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppLargeText(
                        text: "Explore more",
                        color: Colors.black,
                        size: 22,
                      ),
                      AppText(
                        text: "See all",
                        color: Colors.black54,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 120,
                  width: double.maxFinite,
                  margin: const EdgeInsets.only(left: 20),
                  child: ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 40),
                          child: Column(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: AssetImage("assets/img/" +
                                        images.keys.elementAt(index)),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: AppText(
                                  text: images.values.elementAt(index),
                                  color: Colors.black54,
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                )
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return CirclePainter(color: color, radius: radius);
  }
}

class CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = new Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}
