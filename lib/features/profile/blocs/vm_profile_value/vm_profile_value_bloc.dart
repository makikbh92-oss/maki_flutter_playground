import 'package:maki_flutter_playground/features/profile/profile.dart';

part 'vm_profile_value_event.dart';
part 'vm_profile_value_state.dart';

class VmProfileValueBloc extends Bloc<VmProfileValueEvent, VmProfileValueState> {
  VmProfileValueBloc() : super(const VmProfileValueState()) {
    on<EventProfileValueNameChanged>(_eventProfileValueNameChanged);
    on<EventProfileValueBirthChanged>(_eventProfileValueBirthChanged);
    on<EventProfileValueSexChanged>(_eventProfileValueSexChanged);
    on<EventProfileValueHeightChanged>(_eventProfileValueHeightChanged);
    on<EventProfileValueWeightChanged>(_eventProfileValueWeightChanged);
  }




  Future<void> _eventProfileValueNameChanged(EventProfileValueNameChanged event, Emitter<VmProfileValueState> emit) async {
    emit(state.copyWith(name: event.value));
  }


  Future<void> _eventProfileValueBirthChanged(EventProfileValueBirthChanged event, Emitter<VmProfileValueState> emit) async {
    emit(state.copyWith(birth: event.value));
  }


  Future<void> _eventProfileValueSexChanged(EventProfileValueSexChanged event, Emitter<VmProfileValueState> emit) async {
    emit(state.copyWith(sex: event.value));
  }


  Future<void> _eventProfileValueHeightChanged(EventProfileValueHeightChanged event, Emitter<VmProfileValueState> emit) async {
    emit(state.copyWith(height: event.value));
  }


  Future<void> _eventProfileValueWeightChanged(EventProfileValueWeightChanged event, Emitter<VmProfileValueState> emit) async {
    emit(state.copyWith(weight: event.value));
  }

}
