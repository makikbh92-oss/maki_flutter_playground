import 'package:maki_flutter_playground/bootstrap/bootstrap.dart';
import 'package:flutter/material.dart';


Future<void> bootstrapStart(SharedPreferences prefs) async{
  if(!kIsWeb){
    FlutterNativeSplash.remove();
  }
  Bloc.observer = AppBlocObserver();
  FlutterError.onError = (details) {
    if(kDebugMode){
      log(details.exceptionAsString(), stackTrace: details.stack);
    }
  };

  final BaseOptions baseOptions = BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
      validateStatus: (status) => true
  );

  final Dio dio = Dio(baseOptions);

  runApp(
      MyApp(
        prefs: prefs,
        dio: dio,
      )
  );

}