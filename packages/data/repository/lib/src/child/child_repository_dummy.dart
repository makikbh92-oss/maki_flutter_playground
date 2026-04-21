import 'package:repository/repository.dart';
import 'package:repository/src/common.dart';

class ChildRepositoryDummy implements ChildRepository {
  final ApiClient _api;
  final CommonErrorHandler _errorHandler;

  const ChildRepositoryDummy({
    required ApiClient api,
    required CommonErrorHandler commonErrorHandler,
  }) : _api = api,
       _errorHandler = commonErrorHandler;

  @override
  Future<Either<DataError, DadadocChild>> getChild({required String hospitalId})  =>  _errorHandler.repositoryErrorHandler(
      onService: ()  =>  _api.getChild(hospitalId: hospitalId),
  );

}