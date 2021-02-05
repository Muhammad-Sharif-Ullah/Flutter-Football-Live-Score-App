import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sports_app/app/modules/home/controllers/home_controller.dart';
import 'package:sports_app/common/appColor.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        leading: Icon(Icons.menu),
        elevation: 0,
        backgroundColor: AppColor.primaryColor,
        title: TextFormField(
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'SOCCERBOARD',
            hintStyle: TextStyle(color: Colors.white,),
            helperMaxLines: 1,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.white,
            onPressed: () => controller.readDataFromFirebase(),
          ),
        ],
      ),
      body: Obx(()=>controller.displayView()),
    );
  }
}
