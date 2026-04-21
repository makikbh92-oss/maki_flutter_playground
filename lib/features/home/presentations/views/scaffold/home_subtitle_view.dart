import 'package:flutter/material.dart';
import 'package:maki_flutter_playground/features/home/blocs/vm_home_profile/vm_home_profile_bloc.dart';
import 'package:maki_flutter_playground/features/home/home.dart';

class HomeSubtitleView extends StatelessWidget {
  const HomeSubtitleView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<VmHomeNavigationBloc, VmHomeNavigationState, NavType>(
        selector: (state) => state.type,
        builder: (context, type) =>
        switch(type){
         NavType.info =>
          const SizedBox(),
          _ =>
          const _SubTitle(),
        }
    );
  }
}


class _SubTitle extends StatelessWidget {
  const _SubTitle();

  @override
  Widget build(BuildContext context) {
    void onPressed() => context.bootstrap.message.demo(context);
    return BlocSelector<VmHomeProfileBloc, VmHomeProfileState, String>(
        selector: (state) => state.profileEntity.name,
        builder: (context, name) =>
            UiSubtitle(
                text: '등록된 자녀',
                childName: name,
                onPressedChild: onPressed,
                onPressedChildren: onPressed
            )
    );
  }
}

