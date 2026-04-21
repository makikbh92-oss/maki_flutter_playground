import 'package:flutter/material.dart';
import 'package:maki_flutter_playground/bootstrap/bootstrap.dart';
import 'package:maki_flutter_playground/features/hospital/detail/blocs/vm_hospital_detail/vm_hospital_detail_bloc.dart';
import 'package:maki_flutter_playground/features/hospital/detail/presentations/views/hospital_detail_profile_view.dart';
import 'package:ui/ui.dart';

import '../../../../../utils/extensions/my_extension.dart';

class HospitalDetailScaffoldView extends StatelessWidget {
  const HospitalDetailScaffoldView({super.key});

  @override
  Widget build(BuildContext context) {
    return UiScaffold(
        appbar: UiAppbar.leading(
          onPressed: () => context.bootstrap.goRouter.pop(context),
        ),
        body:  HospitalDetailProfileView(),
        bottomNavigationBar: const _Nav(),
    );
  }
}


class _Nav extends StatelessWidget {
  const _Nav();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<VmHospitalDetailBloc, VmHospitalDetailState, ({bool isMy, DadadocHospital hospital})>(
        selector: (state) => state.extra,
        builder: (context, extra) => extra.isMy
            ? UiBottomNavigationButton(
            onPressed: () => context.bootstrap.message.demo(context),
            text: "문진표 작성"
        ) : UiBottomNavigationButton(
            onPressed: () => context.bootstrap.goRouter.popResult(context: context, result: extra.hospital),
            text: "다다닥 의료진 설정"
        )
    );
  }
}

