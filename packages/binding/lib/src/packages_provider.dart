import 'package:common/common.dart';
import 'package:domain/domain.dart';
import 'package:global/global.dart';
import 'package:repository/repository.dart';
import 'package:service/service.dart';

import 'package:flutter/material.dart';
import 'package:third_party/third_party.dart';
import 'package:provider/single_child_widget.dart';


class PackagesProvider extends StatelessWidget {
  final SharedPreferences prefs;
  final Dio dio;
  final List<SingleChildWidget> managerProviders;
  final Widget child;
  const PackagesProvider({super.key,
    required this.prefs,
    required this.dio,
    required this.managerProviders,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return _Provider(
        commonProviders: commonBinding,

        serviceProviders: serviceBinding(
          prefs: prefs,
          dio: dio,
        ),

        repositoryProviders: repositoryBinding,
        domainProviders: domainBinding,

        globalManager: RepositoryProvider<GlobalManager>(
            create: (BuildContext context) =>
                GlobalManager()
        ),

        managerProviders: managerProviders,
        child: MultiBlocProvider(
            providers: [

              BlocProvider<GmLoadingBloc>(
                  create: (BuildContext context) =>
                      GmLoadingBloc(
                        helper: context.read<BlocHelperRepository>()
                      )
              ),

              BlocProvider<GmRedirectionBloc>(
                  create: (BuildContext context) =>
                      GmRedirectionBloc()
              ),

            ],
            child: child
        )
    );
  }
}


class _Provider extends StatelessWidget {
  final List<SingleChildWidget> commonProviders;

  final List<SingleChildWidget> serviceProviders;
  final List<SingleChildWidget> repositoryProviders;
  final List<SingleChildWidget> domainProviders;
  final SingleChildWidget globalManager;
  final List<SingleChildWidget> managerProviders;
  final Widget child;
  const _Provider({
    required this.commonProviders,
    required this.serviceProviders,
    required this.repositoryProviders,
    required this.domainProviders,
    required this.globalManager,
    required this.managerProviders,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          ...commonProviders,
          ...serviceProviders,
          ...repositoryProviders,
          ...domainProviders,
          globalManager,
          ...managerProviders
        ],
        child: child
    );
  }
}

