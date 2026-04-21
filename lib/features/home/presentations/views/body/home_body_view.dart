import 'package:flutter/material.dart';
import 'package:maki_flutter_playground/features/home/blocs/vm_home_profile/vm_home_profile_bloc.dart';
import 'package:maki_flutter_playground/features/home/home.dart';
import 'package:maki_flutter_playground/features/home/managers/home_manager.dart';
import 'package:maki_flutter_playground/features/home/presentations/views/body/home_profile_card_view.dart';

class HomeBodyView extends StatelessWidget {
  const HomeBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _Profile(),
        _Time(),
        _Telehealth(),
        UiLayout.sizedBox()
      ],
    );
  }
}

class _Profile extends StatelessWidget {
  const _Profile();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<VmHomeProfileBloc, VmHomeProfileState, ProfileEntity>(
        selector: (state) => state.profileEntity,
        builder: (context, entity) =>
            HomeProfileCardView(
                entity: entity,
                onPressedList: () async => await context.home.selectHospital(context),
                onPressedInfo: () => context.bootstrap.goRouter.path.hospitalDetailPagePushResult(context: context, hospital: entity.myHospital!, isMy: true)
            )
    );
  }
}


class _Time extends StatelessWidget {
  const _Time();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<VmHomeProfileBloc, VmHomeProfileState, DadadocHospital?>(
        selector: (state) => state.profileEntity.myHospital,
        builder: (context, myHospital) =>
        switch(myHospital){
          null => const SizedBox(),
          _ => UiHospitalTime(
            onPressedMoreVert: () => context.bootstrap.message.dialog.dailyScheduleDialog(
                context: context, hospitalName: myHospital.hospitalName, businessHours: myHospital.businessHours
            ),
            hospitalName: myHospital.hospitalName,
            businessHours:  myHospital.businessHours,
            breakTimeHtml: myHospital.breakTimeHtml,
          )
        }
    );
  }
}

class _Telehealth extends StatelessWidget {
  const _Telehealth();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<VmHomeProfileBloc, VmHomeProfileState, DadadocHospital?>(
        selector: (state) => state.profileEntity.myHospital,
        builder: (context, myHospital) =>
        switch(myHospital){
          null =>
              UiTelehealthCard(
                button: (
                onPressed: () async => await context.home.selectHospital(context),
                text: '다다닥 의료진 등록',
                icon: Icons.local_hospital
                ),
                title: (
                titleColor: TitleColor.warning,
                text: '의료진 미등록',
                ),
                body: '비대면 진료를 신청하기 위해서는 다다닥 의료진 등록이 필요합니다. 의료진 등록 버튼을 눌러 다다닥 의료진을 설정해주세요.',
              ),
          _ =>
              UiTelehealthCard(
                button: (
                onPressed: () => context.bootstrap.message.demo(context),
                text: '문진표 작성',
                icon: Icons.assignment
                ),
                title: (
                titleColor: TitleColor.primaryTertiary,
                text: '진료 신청',
                ),
                body: '문진표를 작성해 주시면 입력하신 상태와 증상을 바탕으로 진료 신청이 진행됩니다.',
              )
        }
    );
  }
}


