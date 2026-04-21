part of 'vm_home_profile_bloc.dart';



final class VmHomeProfileState extends Equatable {
  final Status status;
  final DataError error;
  final ProfileEntity profileEntity;

  const VmHomeProfileState({
    this.status = Status.initial,
    this.error = const DataError(),
    this.profileEntity = const ProfileEntity(),
  });

  VmHomeProfileState copyWith({
    Status? status,
    DataError? error,
    ProfileEntity? profileEntity,
  }) {
    return VmHomeProfileState(
      status: status ?? this.status,
      error: error ?? this.error,
      profileEntity: profileEntity ?? this.profileEntity,
    );
  }

  @override
  List<Object> get props => [status, error, profileEntity];

}
