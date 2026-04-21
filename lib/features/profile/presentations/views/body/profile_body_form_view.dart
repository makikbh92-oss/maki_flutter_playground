import 'package:flutter/material.dart';
import 'package:maki_flutter_playground/features/profile/profile.dart';

class ProfileBodyFormView extends StatelessWidget {
  const ProfileBodyFormView({super.key});

  @override
  Widget build(BuildContext context) {

    final VmProfileValueBloc bloc = context.read<VmProfileValueBloc>();

    return UiLayout(
        child: Column(
          children: [
            UiFormRowLabel(
                label: '이름',
                child: UiTextFormField.name(
                  callback: (name) => bloc.add(EventProfileValueNameChanged(name)),

                )
            ),

            const UiPad(type: PadType.height16),
            const _Birth(),
            const UiPad(type: PadType.height16),
            const _BodyInfo(),
            const UiPad(type: PadType.height16),
          ],
        )
    );
  }
}

class _Birth extends StatelessWidget {
  const _Birth();

  @override
  Widget build(BuildContext context) {

    return BlocSelector<VmProfileValueBloc, VmProfileValueState, String>(
        selector: (state) => state.birth,
        builder: (context, birth) => UiFormRowLabel(
            label: "생년월일",
            child: UiFormButton(
                onPressed: (){
                  Theme.of(context).extension<DsFunc>()!.pickDate(
                      context: context,
                      date: birth,
                      callback: (birth) => context.read<VmProfileValueBloc>().add(EventProfileValueBirthChanged(birth))
                  );
                },
                hintText: "날짜를 선택해주세요.",
                text: birth
            )
        ),
    );
  }
}



class _BodyInfo extends StatelessWidget {
  const _BodyInfo();

  @override
  Widget build(BuildContext context) {

    final VmProfileValueBloc bloc = context.read<VmProfileValueBloc>();

    return UiFormRowLabel(
        label: '신체정보',
        child: Row(
          children: [
            Expanded(
                child: UiTextFormField.height(
                    callback: (height) => bloc.add(EventProfileValueHeightChanged(height)),

                )
            ),
            const UiPad(type: PadType.width16),
            Expanded(
                child: UiTextFormField.weight(
                  callback: (weight) => bloc.add(EventProfileValueWeightChanged(weight)),

                )
            ),
          ],
        )
    );
  }
}

