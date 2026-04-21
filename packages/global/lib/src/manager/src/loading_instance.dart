import 'package:flutter/material.dart';
import 'package:global/src/bloc/bloc.dart';
import 'package:third_party/third_party.dart';

class LoadingInstance {
  const LoadingInstance();

  void change({
    required BuildContext context,
    required bool isLoading,
  }) => context.read<GmLoadingBloc>().add(
      LoadingChange(
          isLoading: isLoading,
      )
  );

}