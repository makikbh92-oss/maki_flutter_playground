import 'package:repository/repository.dart';
import 'package:repository/src/common.dart';


class ProfileRepositoryRemote implements ProfileRepository {
  final ThirdPartyApiClient _thirdParty;
  final CommonErrorHandler _errorHandler;

  const ProfileRepositoryRemote({
    required ThirdPartyApiClient thirdPartyApiClient,
    required CommonErrorHandler commonErrorHandler,
  })
      : _thirdParty = thirdPartyApiClient,
        _errorHandler = commonErrorHandler;

  @override
  Future<Either<DataError, String>> getThumbNail({
    required String title,
    required String cancel,
    required String done,
  }) =>
      _errorHandler.repositoryErrorHandler(
          onService: () async =>
          await _thirdParty.pickThumbNail(
            title: title,
            cancel: cancel,
            done: done,
          )
      );



}