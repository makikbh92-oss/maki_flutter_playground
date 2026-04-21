import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:maki_flutter_playground/features/home/blocs/vm_home_profile/vm_home_profile_bloc.dart';

import 'package:maki_flutter_playground/features/home/home.dart';
import 'package:maki_flutter_playground/features/home/managers/home_manager.dart';



class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return _Provider();
  }
}

class _Provider extends StatelessWidget {
  const _Provider();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<VmHomeNavigationBloc>(
              create: (BuildContext context) =>
                  VmHomeNavigationBloc()
          ),
          BlocProvider<VmHomeProfileBloc>(
              create: (BuildContext context) =>
                  VmHomeProfileBloc(
                    profileGetUseCase: context.read<ProfileGetUseCase>()
                  )..add(const EventGetProfile())
          )
        ],
        child: RepositoryProvider<HomeManager>(
            create: (context) => HomeManager(),
            child: const HomeScaffoldView()
        )
    );
  }
}

