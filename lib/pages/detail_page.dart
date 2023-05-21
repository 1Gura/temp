import 'package:flutter/material.dart';
import 'package:temp/misc/colors.dart';
import 'package:temp/widgets/app_large_text.dart';
import 'package:temp/widgets/app_text.dart';
import 'package:temp/widgets/simple_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;

  @override
  Widget build(BuildContext context) {
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
                  height: 300,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/img/konvert.jpg"),
                          fit: BoxFit.cover)),
                )),
            Positioned(
                left: 20,
                top: 50,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.menu),
                      color: Colors.black,
                    )
                  ],
                )),
            Positioned(
                top: 270,
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
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
                            text: "YSOEMITE",
                            color: Colors.black87,
                          ),
                          AppLargeText(
                            text: "\$ 250",
                            color: Colors.black87,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.location_city_outlined),
                          const SizedBox(
                            width: 5,
                          ),
                          AppText(
                            text: "USA, California",
                            color: Colors.deepPurple,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(
                                5,
                                (index) => Icon(
                                      Icons.star,
                                      color: index < gottenStars
                                          ? Color.fromARGB(255, 255, 165, 0)
                                          : Colors.grey,
                                    )),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          AppText(
                            text: "(4.0)",
                            color: Colors.grey,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AppLargeText(
                        text: "People",
                        color: Colors.black87,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AppText(
                        text: "Number of people in your group",
                        color: Colors.black54,
                      ),
                      Wrap(
                        children: List.generate(
                            5,
                            (index) => Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  child: SimpleButton(
                                      size: 50,
                                      color: Colors.black87,
                                      backgroundColor: AppColors.backgroundColor1,
                                      borderColor: AppColors.backgroundColor1,
                                      text: (index + 1).toString()),
                                )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
