part of 'vm_home_profile_bloc.dart';


sealed class VmHomeProfileEvent extends Equatable {
  const VmHomeProfileEvent();

  @override
  List<Object?> get props => [];
}

final class EventGetProfile extends VmHomeProfileEvent {
  final DadadocHospital? hospital;
  const EventGetProfile({
    this.hospital
  });
}


