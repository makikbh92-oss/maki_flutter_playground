import 'package:maki_flutter_playground/bootstrap/bootstrap.dart';


class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    if(kDebugMode){
      log('${bloc.runtimeType} $event');
    }
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if(kDebugMode){
      log('${bloc.runtimeType} $change');
    }

  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    if(kDebugMode){
      log('${bloc.runtimeType} $transition');
    }
  }
}