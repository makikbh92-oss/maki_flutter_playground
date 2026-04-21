part of 'vm_home_navigation_bloc.dart';

enum NavType {home, observation, telehealth, history, info}

final class VmHomeNavigationState extends Equatable {
  final NavType type;

  const VmHomeNavigationState({
    this.type = NavType.home
  });

  VmHomeNavigationState copyWith({
    NavType? type
  }) => VmHomeNavigationState(
    type: type ?? this.type,
  );

  @override
  List<Object> get props => [
    type
  ];

}
