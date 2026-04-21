
import 'package:maki_flutter_playground/features/home/home.dart';

part 'vm_home_profile_event.dart';
part 'vm_home_profile_state.dart';

class VmHomeProfileBloc extends Bloc<VmHomeProfileEvent, VmHomeProfileState> {
  final ProfileGetUseCase _profileGetUseCase;
  VmHomeProfileBloc({
    required ProfileGetUseCase profileGetUseCase
  }) :  _profileGetUseCase = profileGetUseCase,
        super( const VmHomeProfileState()) {
    on<EventGetProfile>(_eventGetProfile);
  }

  Future<void> _eventGetProfile(EventGetProfile event, Emitter<VmHomeProfileState> emit) async {
    emit(state.copyWith(status: Status.loading, error: const DataError()));
    await emit.forEach(_profileGetUseCase.call(hospital: event.hospital ?? const DadadocHospital()),
        onData: (result) => result.fold(
            (error) => state.copyWith(status: Status.error, error: error),
            (value) => state.copyWith(status: Status.success, profileEntity: value)
        )
    );

  }

}
