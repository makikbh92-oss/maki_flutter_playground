part of 'vm_hospital_detail_bloc.dart';


sealed class VmHospitalDetailEvent extends Equatable {

  const VmHospitalDetailEvent();

  @override
  List<Object> get props => [];

}

final class EventHospitalDetailLoad extends VmHospitalDetailEvent {
  final ({bool isMy, DadadocHospital hospital}) extra;
  const EventHospitalDetailLoad({required this.extra});
}
