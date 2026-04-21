import 'package:common/common.dart';
import 'package:core/core.dart';
import '../logger/common_logger.dart';
import 'package:fpdart/fpdart.dart';


class CommonErrorHandler {
  final CommonLogger _logger;
  final CommonFunc _func;
  const CommonErrorHandler({
    required CommonLogger commonLogger,
    required CommonFunc commonFunc
  }) : _logger = commonLogger,
       _func = commonFunc;


  Stream<Either<DataError, T>> domainErrorHandler<T>({
    required Future<Either<DataError, T>> Function() onRepository,
  }) => Stream.fromFuture(
      _toFuture<T>(
        onRepository: onRepository,
      )
  );

  Future<Either<DataError, T>> _toFuture<T>({
    required Future<Either<DataError, T>> Function() onRepository,
  }) async {

    try {
      final Either<DataError, T> result = await onRepository();
      return result;
    } on DataError catch (e) {
      return Either.left(e);
    }
    catch (e, s) {
      _logger.show(where: 'Domain Unknown', e: e, s: s);
      return Either.left(DataError.unknown());
    }
  }


  Future<Either<DataError, T>> repositoryErrorHandler<T>({
    required Future<T> Function() onService,
  }) async {

    final bool isNetwork = await _func.getInternetStatus();
    if (!isNetwork) {
      return Either.left(const DataError(code: ErrorCode.network));
    }
    try {
      final T result = await onService();
      return Either.right(result);

      //   result.fold(
      //     (error) => switch(error){
      //       LaterPart() => DataDto.later(),
      //       FailurePart(: final String message) => DataDto.failure(message: message),
      //       ErrorPart(: final String message) => DataDto.error(message: message),
      //       TokenPart(: final String message) => DataDto.token(message: message),
      //       ExceptionPart(: final String message) => DataDto.exception(message: message),
      //       FirebaseExceptionPart(: final String message) => DataDto.firebaseException(message: message)
      //     },
      //     (value) => DataDto.success(data: value)
      // );
    } on DataError catch (e) {
      return Either.left(e);
    }
    catch (e, s) {
      _logger.show(where: 'Repository Unknown', e: e, s: s);
      return Either.left(DataError.unknown());
    }
  }


  Future<T> serviceErrorHandler<T>({
    required Future<T> Function() onService,
  }) async {

    try {
      return await onService();
    }
    catch (e, s) {
      _logger.show(where: 'service_error', e: e, s: s);
      throw const DataError(message: errorMessageService);
    }
  }


  Future<T> thirdParty<T>(Future<T> Function() api) async {
    try{
      return await api();
    }
    on DataError catch(_){
      rethrow;
    }
    catch(e, s){
      _logger.show(
        where: 'Service ThirdPartyException',
        e: e,
        s: s,
      );
      throw const DataError(message: errorMessageService);
    }
  }



}