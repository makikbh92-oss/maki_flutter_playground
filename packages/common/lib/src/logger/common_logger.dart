import 'package:third_party/third_party.dart';
import 'package:flutter/foundation.dart';

class CommonLogger {
  final Logger _logger;
  const CommonLogger({
    required Logger logger,
  }) : _logger = logger;

  void show({required String where, required Object? e, required StackTrace? s}){
    if(kDebugMode){
      _logger.e(e,error: e, stackTrace: s);
    }
  }





}