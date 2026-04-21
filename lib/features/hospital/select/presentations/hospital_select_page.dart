import 'package:flutter/material.dart';
import 'package:maki_flutter_playground/features/hospital/select/hospital_select.dart';


class HospitalSelectPage extends StatelessWidget {
  const HospitalSelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _Provider();
  }
}

class _Provider extends StatelessWidget {
  const _Provider();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<VmHospitalSelectListBloc>(
              create: (BuildContext context) => VmHospitalSelectListBloc(
                blocHelperRepository: context.read<BlocHelperRepository>(),
                hospitalRepository: context.read<HospitalRepository>(),
              )..add(const EventHospitalSelectListLoad(isReset: true))
          )
        ],
        child: _Listener()
    );
  }
}


class _Listener extends StatelessWidget {
  const _Listener();

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
        listeners: [
          BlocListener<VmHospitalSelectListBloc, VmHospitalSelectListState>(
              listener: (context, state) {
                if(state.status == Status.loading){
                  context.global.loading.change(context: context, isLoading: true);
                }
                else{
                  context.global.loading.change(context: context, isLoading: false);
                }
                if(state.hasMore == false && state.hospitals.isNotEmpty){
                  context.bootstrap.message.toast.show(context: context, text: '마지막 페이지입니다.');
                }
              },
              listenWhen: (previous, current) => previous.status != current.status
          ),
        ],
        child: const HospitalSelectScaffoldView()
    );
  }
}

