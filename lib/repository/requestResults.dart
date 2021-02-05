import 'package:flutter/material.dart';

class RequestResult<T> {
  final bool isError;
  final T data;
  final String errorType;
  final T errorMessage;

  RequestResult(
      {@required this.isError,
        @required this.data,
        @required this.errorMessage,
        @required this.errorType});
}
