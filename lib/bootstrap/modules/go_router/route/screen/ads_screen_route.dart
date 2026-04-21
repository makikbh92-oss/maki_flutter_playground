import 'package:flutter/material.dart';
import 'package:maki_flutter_playground/bootstrap/bootstrap.dart';


GoRoute adsScreen = GoRoute(
    path: adsScreenPath,
    builder: (BuildContext context, GoRouterState state){
      return const AdsPage();
    }
);