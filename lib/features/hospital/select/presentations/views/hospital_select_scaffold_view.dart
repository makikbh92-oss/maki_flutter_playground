import 'package:flutter/material.dart';
import 'package:maki_flutter_playground/features/hospital/select/hospital_select.dart';

class HospitalSelectScaffoldView extends StatelessWidget {
  const HospitalSelectScaffoldView({super.key});

  @override
  Widget build(BuildContext context) {
    return UiScaffold(
        appbar: UiAppbar.leadingTitle(
            onPressed: () => context.bootstrap.goRouter.pop(context),
            text: '다다닥 의료진',
        ),
        body:  HospitalSelectListView()
    );
  }
}



