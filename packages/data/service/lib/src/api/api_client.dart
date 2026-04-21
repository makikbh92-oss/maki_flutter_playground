import 'package:service/src/common.dart';
import 'package:third_party/third_party.dart';

class ApiClient {
  final CommonErrorHandler _errorHandler;
  const ApiClient({
    required CommonErrorHandler commonErrorHandler,
  }) : _errorHandler = commonErrorHandler;

  Future<List<DadadocHospital>> getHospitalList({
    required int page,
    int pageSize = 20,
  }) => _errorHandler.serviceErrorHandler(
      onService: () async {
        final List<DadadocHospital> all = generateDummyHospitals();
        await Future.delayed(const Duration(milliseconds: 200));
        final start = page * pageSize;
        if (start >= all.length) return [];

        final end = (start + pageSize).clamp(0, all.length);
        return all.sublist(start, end);
      },
  );

  Future<DadadocChild> getChild({required String hospitalId}) async => await _errorHandler.serviceErrorHandler(
      onService: () async {
        final DadadocChild result = DadadocChild.dummy(hospitalId: hospitalId);
        await Future.delayed(const Duration(milliseconds: 200));
        return result;
      },
  );

  Future<DadadocHospitalDetail> getHospitalDetail({
    required DadadocHospital hospital,
  }) async => await _errorHandler.serviceErrorHandler(
    onService: () async {
      final DadadocHospitalDetail result = DadadocHospitalDetail(
        hospitalId: hospital.hospitalId,
        hospitalName: hospital.hospitalName,
        doctorName: hospital.doctorName,
        thumbnail: hospital.thumbnail,
        features: hospital.features,
        businessHours: hospital.businessHours,
        breakTimeHtml:  hospital.breakTimeHtml,
        noticeHtml: randomNoticeHtml(),
        historyHtml: randomHistoryHtml(hospital.hospitalName),
        introduceHtml: randomIntroduceHtml(hospital.hospitalName),
      );
      await Future.delayed(const Duration(milliseconds: 200));
      return result;
    },
  );







}