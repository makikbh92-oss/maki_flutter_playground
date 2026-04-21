part of 'vm_profile_value_bloc.dart';

sealed class VmProfileValueEvent extends Equatable {
  const VmProfileValueEvent();

  @override
  List<Object> get props => [];
}




final class EventProfileValueNameChanged extends VmProfileValueEvent {
  final String value;
  const EventProfileValueNameChanged(this.value);
}

final class EventProfileValueBirthChanged extends VmProfileValueEvent {
  final String value;
  const EventProfileValueBirthChanged(this.value);
}

final class EventProfileValueSexChanged extends VmProfileValueEvent {
  final String value;
  const EventProfileValueSexChanged(this.value);
}

final class EventProfileValueHeightChanged extends VmProfileValueEvent {
  final String value;
  const EventProfileValueHeightChanged(this.value);
}

final class EventProfileValueWeightChanged extends VmProfileValueEvent {
  final String value;
  const EventProfileValueWeightChanged(this.value);
}
