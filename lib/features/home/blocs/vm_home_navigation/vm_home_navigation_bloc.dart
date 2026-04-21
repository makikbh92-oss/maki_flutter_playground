import 'package:maki_flutter_playground/features/home/home.dart';

part 'vm_home_navigation_event.dart';
part 'vm_home_navigation_state.dart';

class VmHomeNavigationBloc extends Bloc<VmHomeNavigationEvent, VmHomeNavigationState> {
  VmHomeNavigationBloc() : super(const VmHomeNavigationState()) {
    on<EventHomeNavigationChanged>(_eventBoomcareNavigationChanged);
  }

  Future<void> _eventBoomcareNavigationChanged(EventHomeNavigationChanged event, Emitter<VmHomeNavigationState> emit) async {
    emit(state.copyWith(type: event.type));
  }

}
