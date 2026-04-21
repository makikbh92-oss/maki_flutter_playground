import 'package:maki_flutter_playground/bootstrap/bootstrap.dart';
import 'package:flutter/material.dart';
import 'package:maki_flutter_playground/features/hospital/detail/presentations/hospital_detail_page.dart';
import 'package:maki_flutter_playground/features/profile/presentations/profile_page.dart';


GoRoute profilePage = GoRoute(
    path: pathProfilePage,
    name: nameProfilePage,
    builder: (BuildContext context, GoRouterState state){

      return ProfilePage();
    }
);