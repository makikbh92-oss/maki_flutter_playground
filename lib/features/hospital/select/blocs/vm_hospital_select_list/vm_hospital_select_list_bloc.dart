import 'package:maki_flutter_playground/features/hospital/select/hospital_select.dart';

part 'vm_hospital_select_list_event.dart';
part 'vm_hospital_select_list_state.dart';

class VmHospitalSelectListBloc extends Bloc<VmHospitalSelectListEvent, VmHospitalSelectListState> {
  final BlocHelperRepository _helper;
  final HospitalRepository _repository;
  VmHospitalSelectListBloc({
    required BlocHelperRepository blocHelperRepository,
    required HospitalRepository hospitalRepository,
  }) :  _helper = blocHelperRepository,
        _repository = hospitalRepository,
        super(const VmHospitalSelectListState()) {
    on<EventHospitalSelectListLoad>(_eventHospitalSelectListLoad,
        transformer: _helper.debounceTransformer(Duration(milliseconds: 50))
    );
  }

  Future<void> _eventHospitalSelectListLoad(
      EventHospitalSelectListLoad event,
      Emitter<VmHospitalSelectListState> emit,
      ) async {

    final int currentPage = event.isReset ? 0 : state.currentPage; // 캡처

    emit(state.copyWith(
      status: Status.loading,
      error: const DataError(),
      hospitals: event.isReset ? [] : null,
      hasMore: event.isReset ? false : null,
      currentPage: currentPage,
    ));

    await emit.forEach(
      Stream.fromFuture(
        _repository.getList(page: currentPage),
      ),
      onData: (result) => result.fold(
            (error) => state.copyWith(status: Status.error, error: error),
            (value) => state.copyWith(
          status: Status.success,
          hospitals: [...state.hospitals, ...value],
          hasMore: value.isNotEmpty,
          currentPage: value.isNotEmpty ? currentPage + 1 : state.currentPage,
        ),
      ),
    );
  }

}
