import 'package:repository/src/common.dart';

abstract class ChildRepository {
  const ChildRepository();

  Future<Either<DataError, DadadocChild>> getChild({required String hospitalId});

}