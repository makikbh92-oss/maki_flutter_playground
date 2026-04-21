import 'package:flutter/material.dart';
import 'package:maki_flutter_playground/bootstrap/bootstrap.dart';



GoRoute homeScreen = GoRoute(
    path: homeScreenPath,
    builder: (BuildContext context, GoRouterState state){
      return const HomePage();
    }
);