import 'package:flutter/material.dart';

import 'package:maki_flutter_playground/features/home/home.dart';
import 'package:maki_flutter_playground/features/home/blocs/vm_home_profile/vm_home_profile_bloc.dart';

class HomeManager {
  const HomeManager();

  Future<void> selectHospital(BuildContext context) async {
    final DadadocHospital? select = await context.bootstrap.goRouter.path.hospitalSelectPagePushResult(context);
    if(select != null){
      if(context.mounted){
        context.read<VmHomeProfileBloc>().add(EventGetProfile(hospital: select));
      }
    }
  }

}

extension HomeExtension on BuildContext {
  HomeManager get home => read<HomeManager>();
}