import 'package:repository/repository.dart';
import 'package:repository/src/common.dart';


class HospitalRepositoryDummy implements HospitalRepository {
  final ApiClient _api;
  final CommonErrorHandler _errorHandler;

  const HospitalRepositoryDummy({
    required ApiClient api,
    required CommonErrorHandler commonErrorHandler,
  }) : _api = api,
       _errorHandler = commonErrorHandler;

  @override
  Future<Either<DataError, List<DadadocHospital>>> getList({
    required int page,
    int pageSize = 20,
  })  =>  _errorHandler.repositoryErrorHandler(
      onService: ()  =>  _api.getHospitalList(
        page: page,
        pageSize: pageSize,
      ),
  );



  @override
  Future<Either<DataError, DadadocHospitalDetail>> getDetail({required DadadocHospital hospital})  =>  _errorHandler.repositoryErrorHandler(
    onService: ()  =>  _api.getHospitalDetail(hospital: hospital),
  );



}