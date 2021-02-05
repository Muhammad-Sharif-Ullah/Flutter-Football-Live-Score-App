import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sports_app/repository/requestResults.dart';

class RequestStatus {

  static returnResponse(_response, _responseBody){
    switch (_response.statusCode) {
      case 200:
        if(_responseBody.runtimeType ==  Map){
          final _status = _responseBody['status'] == false ? true : false;
          print('It\'s a Map Req');
          return RequestResult(isError: _status, data: _responseBody, errorMessage: _responseBody['message'], errorType: 'No Error');
        }
        print('It\'s a List Req');
        return RequestResult(isError: false, data: _responseBody, errorMessage: null,  errorType: 'No Error');
        break;
      case 400:
        return RequestResult(isError: _responseBody['status'], data:  _responseBody['body'], errorMessage:  _responseBody['message'],  errorType: 'RE');
        break;
      case 401:
      case 403:
        return RequestResult(isError: _responseBody['status'], data:  _responseBody['body'], errorMessage:  _responseBody['message'],  errorType: 'RE');
        break;
      case 500:
      default:
        return RequestResult(isError: _responseBody['status'], data:  _responseBody['body'], errorMessage:  _responseBody['message'],  errorType: 'RE');
        break;
    }
  }
  static RequestResult responseStatus(http.Response _response) {
    final  _responseBody = jsonDecode(_response.body);
    print('[Response Code] ${_response.statusCode}');
    print('[Response Body] $_responseBody');
    return returnResponse(_response, _responseBody);
  }


}
