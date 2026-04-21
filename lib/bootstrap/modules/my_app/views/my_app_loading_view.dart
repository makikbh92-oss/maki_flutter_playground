import 'package:flutter/material.dart';
import 'package:maki_flutter_playground/bootstrap/bootstrap.dart';


class MyAppLoadingView extends StatelessWidget {
  final Widget child;
  const MyAppLoadingView({super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    if(kDebugMode){
      log('리팩토링 테스트: MyAppLoadingView');
    }
    return Stack(
      children: [
        child,
        const _Loading(),
      ],
    );
  }
}

class _Loading extends StatelessWidget {

  const _Loading();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GmLoadingBloc, GmLoadingState>(
        builder: (context, state) =>
          switch(state.isLoading){
            true =>
                UiLoadingWidget(
                  onPressed: (){
                    context.read<GlobalManager>().loading.change(context: context, isLoading: false);
                  },
                ),
            _ => const SizedBox()
          },
        buildWhen: (pre, cur) => pre.isLoading != cur.isLoading,
    );
  }
}