import 'package:flutter/material.dart';
import 'package:maki_flutter_playground/features/hospital/detail/blocs/vm_hospital_detail/vm_hospital_detail_bloc.dart';
import 'package:maki_flutter_playground/features/hospital/detail/presentations/views/hospital_detail_scaffold_view.dart';
import 'package:third_party/third_party.dart';
import 'package:core/core.dart';
import 'package:repository/repository.dart';
import 'package:maki_flutter_playground/bootstrap/manager/bootstrap_manager.dart';
import '../../../../utils/extensions/my_extension.dart';



class HospitalDetailPage extends StatelessWidget {
  final ({bool isMy, DadadocHospital hospital}) extra;
  const HospitalDetailPage({super.key,
    required this.extra
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<VmHospitalDetailBloc>(
              create: (BuildContext context) => VmHospitalDetailBloc(
                hospitalRepository: context.read<HospitalRepository>(),
              )..add(EventHospitalDetailLoad(extra: extra))
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
          BlocListener<VmHospitalDetailBloc, VmHospitalDetailState>(
              listener: (context, state) {
                if(state.status == Status.loading){
                  context.global.loading.change(context: context, isLoading: true);
                }
                else{
                  context.global.loading.change(context: context, isLoading: false);
                  if(state.status == Status.error){
                    if(state.error.message.isNotEmpty){
                      context.bootstrap.message.toast.show(context: context, text: state.error.message);
                    }
                  }
                }
              },
              listenWhen: (previous, current) => previous.status != current.status
          ),
        ],
        child: const HospitalDetailScaffoldView()
    );
  }
}

