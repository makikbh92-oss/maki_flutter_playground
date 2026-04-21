import 'package:third_party/third_party.dart';
import 'package:core/core.dart';
import 'package:repository/repository.dart';

part 'vm_hospital_detail_event.dart';
part 'vm_hospital_detail_state.dart';


class VmHospitalDetailBloc extends Bloc<VmHospitalDetailEvent, VmHospitalDetailState> {
  final HospitalRepository _repository;
  VmHospitalDetailBloc({
    required HospitalRepository hospitalRepository,
  }) :  _repository = hospitalRepository,
        super(const VmHospitalDetailState()) {
    on<EventHospitalDetailLoad>(_eventHospitalDetailLoad);
  }

  Future<void> _eventHospitalDetailLoad(
      EventHospitalDetailLoad event,
      Emitter<VmHospitalDetailState> emit,
      ) async {


    await emit.forEach(
      Stream.fromFuture(
        _repository.getDetail(hospital: event.extra.hospital), // ✅ state.currentPage 아닌 캡처한 변수
      ),
      onData: (result) => result.fold(
            (error) => state.copyWith(status: Status.error, error: error),
            (value) => state.copyWith(
          status: Status.success,
          extra: event.extra,
          detail: value
        ),
      ),
    );
  }

}
