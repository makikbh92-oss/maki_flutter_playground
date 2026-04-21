
import 'package:third_party/third_party.dart';

part 'gm_redirection_event.dart';
part 'gm_redirection_state.dart';

class GmRedirectionBloc extends Bloc<GmRedirectionEvent, GmRedirectionState> {
  // final RouterNotifier routerNotifier;
  GmRedirectionBloc(
    // {required this.routerNotifier,}
  ) : super(const GmRedirectionState()) {
    on<RedirectionGoAds>(_redirectionInitialized);
    on<RedirectionGoHome>(_redirectionGoHome);
  }

  Future<void> _redirectionInitialized(RedirectionGoAds event, Emitter<GmRedirectionState> emit) async {
    // routerNotifier.redirectionGotoAds();
    emit(state.copyWith(redirectType: RedirectType.ads));
  }

  Future<void> _redirectionGoHome(RedirectionGoHome event, Emitter<GmRedirectionState> emit) async {
    // routerNotifier.redirectionGotoAds();
    emit(state.copyWith(redirectType: RedirectType.home));
  }


}
