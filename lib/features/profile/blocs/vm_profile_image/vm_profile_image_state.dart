part of 'vm_profile_image_bloc.dart';


final class VmProfileImageState extends Equatable {
  final Status status;
  final DataError error;
  final String thumbnail;
  final bool isDelete;

  const VmProfileImageState({
    this.status = Status.initial,
    this.error = const DataError(),
    this.thumbnail = '',
    this.isDelete = false,
  });

  VmProfileImageState copyWith({
    Status? status,
    DataError? error,
    String? thumbnail,
    bool? isDelete,
  })  => VmProfileImageState(
      status: status ?? this.status,
      error: error ?? this.error,
      thumbnail: thumbnail ?? this.thumbnail,
      isDelete: isDelete ?? this.isDelete
  );

  @override
  List<Object> get props => [
    status, error, thumbnail, isDelete
  ];

}
