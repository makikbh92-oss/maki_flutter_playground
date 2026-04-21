part of 'vm_home_navigation_bloc.dart';

sealed class VmHomeNavigationEvent extends Equatable {
  const VmHomeNavigationEvent();

  @override
  List<Object> get props => [];
}

final class EventHomeNavigationChanged extends VmHomeNavigationEvent {

  final NavType type;
  const EventHomeNavigationChanged(this.type);

}
