import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sports_app/app/modules/home/controllers/home_controller.dart';
import 'package:sports_app/app/modules/home/model/fixtures_model.dart';
import 'package:sports_app/common/appColor.dart';

class DisplayPage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: Get.width,
        height: Get.height,
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      color: AppColor.bannerColor,
                      alignment: Alignment.center,
                      width: Get.width * .6,
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                      child: Text('Premier League', style: TextStyle(color: Colors.white, fontSize: 18)),
                    ),
                    Container(
                      height: 150,
                      // width: Get.width * .1,
                      // margin: EdgeInsets.symmetric(horizontal: 5),
                      // decoration: BoxDecoration(
                      //   borderRadius:
                      //   BorderRadius.all(Radius.circular(6)),
                      //   color: AppColor.cardColor,
                      // ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Image.network(
                                '${controller.responseData[0].teams.home['logo']}',
                                height: 100,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8),
                                child: Text(
                                    '${controller.responseData[0].teams.home['name']}', style: TextStyle(color: Colors.white)),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                '${controller.responseData[0].goals.home ?? 0} : ${controller.responseData[0].goals.away ?? 0}',
                                style: TextStyle(
                                    fontSize: 45,
                                    fontWeight: FontWeight.bold, color: Colors.white)),
                          ),
                          Column(
                            children: [
                              Image.network(
                                '${controller.responseData[0].teams.away['logo']}',
                                height: 100,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8),
                                child: Text(
                                    '${controller.responseData[0].teams.away['name']}', style:TextStyle(color: Colors.white)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: Get.width,
                decoration: BoxDecoration(
                  color: AppColor.secondaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Premier League',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: Get.width,
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: controller.responseData.length,
                          itemBuilder: (context, int index) {
                            final ResponseData match =
                                controller.responseData[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 12),
                              child: Card(
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6))),
                                child: Container(
                                  height: 150,
                                  // width: Get.width * .1,
                                  // margin: EdgeInsets.symmetric(horizontal: 5),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6)),
                                    color: AppColor.cardColor,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Column(

                                        children: [
                                          Image.network(
                                            '${match.teams.home['logo']}',
                                            height: 100,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8),
                                            child: Text(
                                                '${match.teams.home['name']}'),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                            '${match.goals.home ?? 0} : ${match.goals.away ?? 0}',
                                            style: TextStyle(
                                                fontSize: 45,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Column(
                                        children: [
                                          Image.network(
                                            '${match.teams.away['logo']}',
                                            height: 100,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8),
                                            child: Text(
                                                '${match.teams.away['name']}'),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // ),
    );
  }
}
