import 'package:repository/repository.dart';
import 'package:third_party/third_party.dart';

part 'gm_loading_event.dart';
part 'gm_loading_state.dart';

class GmLoadingBloc extends Bloc<GmLoadingEvent, GmLoadingState> {
  final BlocHelperRepository _helper;
  GmLoadingBloc({
    required BlocHelperRepository helper
  }) :  _helper = helper,
        super(const GmLoadingState()) {
    on<LoadingChange>(_loadingChange, transformer: _helper.throttleTransformer(const Duration(milliseconds: 300)));
  }

  Future<void> _loadingChange(LoadingChange event, Emitter<GmLoadingState> emit) async {
    emit(state.copyWith(
        isLoading: event.isLoading,
    ));
  }

}
