import 'package:repository/src/common.dart';


abstract class HospitalRepository {


  const HospitalRepository();

  Future<Either<DataError, List<DadadocHospital>>> getList({
    required int page,
    int pageSize = 20,
  });



  Future<Either<DataError, DadadocHospitalDetail>> getDetail({required DadadocHospital hospital});

}