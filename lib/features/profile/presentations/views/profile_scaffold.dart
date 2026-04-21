import 'package:flutter/material.dart';

import 'package:maki_flutter_playground/features/profile/profile.dart';

class ProfileScaffold extends StatelessWidget {
  const ProfileScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return const _Scaffold();
  }
}

class _Scaffold extends StatelessWidget {
  const _Scaffold();

  @override
  Widget build(BuildContext context) {
    return UiScaffold(
        appbar: const _Appbar(),
        useScroll: true,
        callbackSystem: () => context.bootstrap.goRouter.pop(context),
        body: const ProfileBodyView(),
        bottomNavigationBar: const _Navbar(),
    );
  }
}


class _Appbar extends StatelessWidget {
  const _Appbar();

  @override
  Widget build(BuildContext context) {

    return  UiAppbar.leadingTitle(
      onPressed: () => context.bootstrap.goRouter.pop(context),
      text: "프로필 생성",
    );
  }
}


class _Navbar extends StatelessWidget {
  const _Navbar();

  @override
  Widget build(BuildContext context) {
    return   UiBottomNavigationButton(
        onPressed: () {
          context.bootstrap.message.demo(context);
        },
        useDebounce: true,
        text: "저장"
    );
  }
}









