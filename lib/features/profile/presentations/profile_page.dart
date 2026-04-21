import 'package:maki_flutter_playground/features/profile/profile.dart';
import 'package:flutter/material.dart';



class ProfilePage extends StatelessWidget {

  const ProfilePage({super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<VmProfileImageBloc>(
              create: (BuildContext context) =>
                  VmProfileImageBloc(
                      profileRepository: context.read<ProfileRepository>()
                  )
          ),
          BlocProvider<VmProfileValueBloc>(
              create: (BuildContext context) =>
              VmProfileValueBloc()
          ),

        ],
        child: const _Listener()
    );
  }
}



class _Listener extends StatelessWidget {
  const _Listener();

  @override
  Widget build(BuildContext context) {
    final GlobalManager global = context.global;
    return MultiBlocListener(
        listeners: [
          BlocListener<VmProfileImageBloc, VmProfileImageState>(
              listener: (context, state) {
                if(state.status == Status.loading){
                  global.loading.change(context: context, isLoading: true);
                }
                else{
                  global.loading.change(context: context, isLoading: false);
                  if(state.status == Status.error){
                   if(state.error.message.isNotEmpty){
                     context.bootstrap.message.toast.show(context: context, text: state.error.message);
                   }
                  }
                }
              },
            listenWhen: (previous, current) => previous.status != current.status,
          ),
        ],
        child: const ProfileScaffold()
    );
  }
}





