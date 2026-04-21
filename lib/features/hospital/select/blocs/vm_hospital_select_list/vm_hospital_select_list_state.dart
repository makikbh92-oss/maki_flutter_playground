part of 'vm_hospital_select_list_bloc.dart';

final class VmHospitalSelectListState extends Equatable {
  final Status status;
  final DataError error;
  final int currentPage;
  final bool hasMore;
  final List<DadadocHospital> hospitals;

  const VmHospitalSelectListState({
    this.status = Status.initial,
    this.error = const DataError(),
    this.currentPage = 0,
    this.hasMore = true,
    this.hospitals = const []
  });

  VmHospitalSelectListState copyWith({
    Status? status,
    DataError? error,
    int? currentPage,
    bool? hasMore,
    List<DadadocHospital>? hospitals,
  }) {
    return VmHospitalSelectListState(
      status: status ?? this.status,
      error: error ?? this.error,
      currentPage: currentPage ?? this.currentPage,
      hasMore: hasMore ?? this.hasMore,
      hospitals: hospitals ?? this.hospitals,
    );
  }

  @override
  List<Object> get props => [
    status,
    error,
    currentPage,
    hasMore,
    hospitals,
  ];
}
