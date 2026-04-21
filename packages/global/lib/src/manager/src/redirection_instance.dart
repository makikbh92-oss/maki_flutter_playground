import 'package:flutter/material.dart';
import 'package:global/src/bloc/bloc.dart';
import 'package:third_party/third_party.dart';

class RedirectionInstance {
  const RedirectionInstance();

  void gotoAds(BuildContext context) => context.read<GmRedirectionBloc>().add(
      const RedirectionGoAds()
  );

  void gotoHome(BuildContext context) => context.read<GmRedirectionBloc>().add(
      const RedirectionGoHome()
  );


}