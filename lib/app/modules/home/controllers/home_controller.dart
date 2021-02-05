import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:sports_app/app/modules/home/firebase_RTDB_model.dart';
import 'package:sports_app/app/modules/home/model/fireBaseModel.dart';
import 'package:sports_app/app/modules/home/model/fixtures_model.dart';
import 'package:sports_app/app/modules/home/views/displayPage.dart';
import 'package:sports_app/repository/appAPI.dart';
import 'package:sports_app/repository/requestResults.dart';
import 'package:firebase_database/firebase_database.dart';

class HomeController extends GetxController {
  final DatabaseReference fBDB = FirebaseDatabase.instance.reference();
  RxBool isLoading = false.obs;
  RxBool isError = false.obs;
  Rx<RequestResult> requestResult = Rx<RequestResult>();
  List<ResponseData> responseData = List<ResponseData>();
  List<ResponseData> firebaseData = List<ResponseData>();
  var data;
  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Widget displayView(){
    return isLoading.value ? Center(child: CircularProgressIndicator()) : DisplayPage();
  }
  void fetchData() async{
    isLoading.toggle();
    final RequestResult response = await AppAPI.fixturesRequest();
    if(!response.isError){
      requestResult.value = response;
      responseData = [...FixturesModel.fromJson(response.data).response];
      print(response.data.runtimeType);
      addDataToFirebaseRealtimeDataBase(response.data);
      print(responseData.length);
    }
    isLoading.toggle();
  }


  void addDataToFirebaseRealtimeDataBase(jsonData){
    final DatabaseReference id = fBDB.child('fixture/').push();
    id.set(jsonData);
    print("DataBase Id : ${id.key}");
  }
  void readDataFromFirebase(){
    // final DatabaseReference
    // final data = fBDB.child('fixture/').child('response');
    // final dummyData = fBDB.reference().child('fixture/').orderByChild('response');
    // // print("Check it : ${dummpyData.runtimeType}");
    // dummyData.once().then((fireData){
    //   final d = fireData.value;
    //   for(var item in d.entries){
    //     final val = d[ '${item.key}'];
    //     // print(val['response'].runtimeType);
    //     // final List<ResponseData>k = [];
    //     // for(int i =0; i<val['response'].lenght; i++){
    //     //   k.add(val[0]);
    //     // }
    //     // // val['response'] as ResposeData();
    //     // print(k[0].league.name);
    //     // print(val['response'].length);
    //     for(int i =0; i< val['response'].length; i++){
    //       // final kkk = val['response'][0];
    //       final List<ResponseData> kkk = [...FixturesModel.fromJson(val['response'][0]).response];
    //       // print(val['response'][0]);
    //       print(kkk[0].league);
    //     }
    //
    //   }
    //   // print(d[0]['response']);
    // });
    // // print(data);
    // // fBDB.once().then((DataSnapshot fireData) {
    // //   firebaseData.clear();
    // //   // final  Iterable<FixtureValue> data =  FirebaseRtdbModel.fromJson(fireData.value).fixture.values
    // //   // ;// fireData.value)
    // //   // final Map data = fireData.value;
    // //   // for(var item in data['fixture'].entries){
    // //   //   print(data['fixture']['${item.key}']['response']);
    // //   //   // firebaseData.add(data['fixture']['${item.key}']['response']);
    // //   //   // final List<ResponseData> l = FixturesModel.fromJson(data['fixture']['${item.key}']).response;
    // //   //   // firebaseData.addAll( FixturesModel.fromJson(data['fixture']['${item.key}']).response);
    // //   //   final
    // //   // }
    // //   print(fireData.value.runtimeType);
    // //   // final val = json.decode(fireData.value);
    // //   // print(val.runtimeType);
    // //   // final data = FirebaseRtdbModel2.fromJson(json.decode(fireData.value));
    // //   // final List<MatchSummery> d = data.fixture['response'].response;
    // //   // print(d[0].fixture.venue);
    // // });
    // print(firebaseData.length);
  }
}
