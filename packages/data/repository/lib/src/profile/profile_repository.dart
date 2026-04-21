import 'package:repository/src/common.dart';


abstract class ProfileRepository {


  const ProfileRepository();

  Future<Either<DataError, String>> getThumbNail({
    required String title,
    required String cancel,
    required String done,
  });

}