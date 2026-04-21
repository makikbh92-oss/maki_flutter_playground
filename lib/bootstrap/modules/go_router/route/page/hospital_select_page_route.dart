import 'package:maki_flutter_playground/bootstrap/bootstrap.dart';
import 'package:flutter/material.dart';


GoRoute hospitalSelectPage = GoRoute(
    path: pathHospitalSelectPage,
    name: nameHospitalSelectPage,
    builder: (BuildContext context, GoRouterState state){
      return const HospitalSelectPage();
    }
);