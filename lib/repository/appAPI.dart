import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:sports_app/repository/appUrl.dart';
import 'package:sports_app/repository/requestResults.dart';
import 'package:sports_app/repository/requestStatus.dart';
class AppAPI{

  static String myToken = "aa6d2e6e0caf2d39eea60686b3b3882a";

  static  Future<RequestResult> fixturesRequest() async{
    try{
      Map<String, String> header = {
        'x-rapidapi-host': "v3.football.api-sports.io",
        'x-rapidapi-key': myToken
      };
      final http.Response response = await http.get(AppUrl.fixturesUrl, headers: header);
      return RequestStatus.responseStatus(response);
    } on SocketException catch (e){
      print(e);
      return RequestResult(isError: true, data: null, errorMessage: e.osError.message, errorType: 'SE');
    } on TimeoutException catch (e){
      return RequestResult(isError: true, data: null, errorMessage: 'Slow Internet, Please try again later', errorType: 'TE' );
    }
  }
  AppAPI._();
}