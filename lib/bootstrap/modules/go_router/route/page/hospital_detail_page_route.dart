import 'package:maki_flutter_playground/bootstrap/bootstrap.dart';
import 'package:flutter/material.dart';
import 'package:maki_flutter_playground/features/hospital/detail/presentations/hospital_detail_page.dart';


GoRoute hospitalDetailPage = GoRoute(
    path: pathHospitalDetailPage,
    name: nameHospitalDetailPage,
    builder: (BuildContext context, GoRouterState state){
      final extra = state.extra as GoRouterData<({bool isMy, DadadocHospital hospital})>;
      return  HospitalDetailPage(
        extra: extra.data,
      );
    }
);