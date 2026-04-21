const String errorMessageUnknown = '알 수 없는 오류가 발생했습니다. 잠시 후 다시 시도해주세요.';
const String errorMessageService = '서비스 이용 중 오류가 발생했습니다. 잠시 후 다시 시도해주세요.';

enum ErrorCode {
  initial, error, unauthorized, network, unknown
}


class DataError {
  final ErrorCode code;
  final String message;

  const DataError({
    this.code = ErrorCode.initial,
    this.message = '',
  });

  factory DataError.error(String message) => DataError(code: ErrorCode.error, message: message);
  factory DataError.network() => const DataError(code: ErrorCode.network);
  factory DataError.unauthorized() => const DataError(code: ErrorCode.unauthorized);
  factory DataError.unknown() => const DataError(code: ErrorCode.unknown, message: errorMessageUnknown);

}



// import 'package:model/model.dart';
//
// sealed class DataError {
//   const DataError();
//   String get message;
//
//   @override
//   String toString() => message;
// }
//
//
//
// class FailurePart extends DataError {
//   @override
//   final String message;
//   const FailurePart(this.message);
//
//
// }
//
//
// class ErrorPart extends DataError {
//   @override
//   final String message;
//
//   const ErrorPart(this.message);
// }
//
// class DuplicatedPart extends DataError {
//   @override
//   final String message = messageDuplicated;
//
//   const DuplicatedPart();
// }
//
//
// class TokenPart extends DataError {
//   @override
//   final String message;
//   const TokenPart(this.message);
// }
//
//
// class ExceptionPart extends DataError {
//   @override
//   final String message;
//
//   const ExceptionPart(this.message);
// }
//
//
// class FirebaseExceptionPart extends DataError {
//   @override
//   final String message;
//
//   const FirebaseExceptionPart(this.message);
//
// }
//
// class UnknownPart extends DataError {
//   @override
//   final String message;
//
//   const UnknownPart(this.message);
//
// }
//
// class NetworkPart extends DataError {
//   @override
//   final String message;
//
//   const NetworkPart(this.message);
//
// }