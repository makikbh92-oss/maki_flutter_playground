import 'package:flutter/material.dart';
import 'package:maki_flutter_playground/features/profile/presentations/views/body/profile_body_form_view.dart';
import 'package:maki_flutter_playground/features/profile/presentations/views/body/profile_body_thumbnail_view.dart';

class ProfileBodyView extends StatelessWidget {
  const ProfileBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ProfileBodyThumbnailView(),
        ProfileBodyFormView(),
      ],
    );
  }
}

// class _Header extends StatelessWidget {
//   const _Header();
//
//   @override
//   Widget build(BuildContext context) {
//
//     return  showHeader
//         ?
//     UiHeaderContainer(
//       body: [localizations.profileHeaderBody1, localizations.profileHeaderBody2],
//     )
//         :
//     const SizedBox();
//   }
// }

