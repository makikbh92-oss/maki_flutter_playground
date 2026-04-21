import 'package:flutter/material.dart';
import 'package:maki_flutter_playground/features/home/home.dart';



class HomeScaffoldView extends StatelessWidget {
  const HomeScaffoldView({super.key});

  @override
  Widget build(BuildContext context) {
    return UiScaffold(
        useScroll: true,
        appbar: UiAppbar.logo(
            onPressed: (){},
            onPressedActions: () => context.bootstrap.goRouter.path.profilePush(context),
        ),
        subTitle: HomeSubtitleView(),
        body: _Body(),
        bottomNavigationBar: _Nav(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<VmHomeNavigationBloc, VmHomeNavigationState, NavType>(
        selector: (state) => state.type,
        builder: (context, type) =>
            IndexedStack(
              index: type.index,
              children: [
                HomeBodyView(),
                SizedBox(),
                SizedBox(),
                SizedBox(),
                SizedBox(),
              ],
            )
    );
  }
}



class _Nav extends StatelessWidget {
  const _Nav();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<VmHomeNavigationBloc, VmHomeNavigationState, NavType>(
        selector: (state) => state.type,
        builder: (context, type) =>
            UiBottomNavigationBar(callback: (index){
              if(NavType.values[index] != NavType.home){
                context.bootstrap.message.demo(context);
              }
              else{
                context.read<VmHomeNavigationBloc>().add(EventHomeNavigationChanged(NavType.values[index]));
              }
            }, currentIndex: type.index)
    );
  }
}

