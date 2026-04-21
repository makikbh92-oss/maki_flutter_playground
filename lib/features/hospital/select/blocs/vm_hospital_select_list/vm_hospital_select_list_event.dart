part of 'vm_hospital_select_list_bloc.dart';


sealed class VmHospitalSelectListEvent extends Equatable {

  const VmHospitalSelectListEvent();

  @override
  List<Object> get props => [];

}

final class EventHospitalSelectListLoad extends VmHospitalSelectListEvent {
  final bool isReset;
  const EventHospitalSelectListLoad({required this.isReset});
}
