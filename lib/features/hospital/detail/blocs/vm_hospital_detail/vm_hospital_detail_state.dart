part of 'vm_hospital_detail_bloc.dart';



final class VmHospitalDetailState extends Equatable {
  final Status status;
  final DataError error;
  final ({bool isMy, DadadocHospital hospital}) extra;
  final DadadocHospitalDetail detail;

  const VmHospitalDetailState({
    this.status = Status.initial,
    this.error = const DataError(),
    this.extra = (isMy: false, hospital: const DadadocHospital()),
    this.detail = const DadadocHospitalDetail()
  });

  VmHospitalDetailState copyWith({
    Status? status,
    DataError? error,
    ({bool isMy, DadadocHospital hospital})? extra,
    DadadocHospitalDetail? detail,
  }) {
    return VmHospitalDetailState(
      status: status ?? this.status,
      error: error ?? this.error,
      extra: extra ?? this.extra,
      detail: detail ?? this.detail,
    );
  }

  @override
  List<Object> get props => [
    status,
    error,
    extra,
    detail
  ];
}
