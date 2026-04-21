import 'package:common/src/logger/common_logger.dart';
import 'package:third_party/third_party.dart';

class CommonFunc {
  final Connectivity _connectivity;
  final CommonLogger _logger;
  const CommonFunc({
    required Connectivity connectivity,
    required CommonLogger logger,
  }) :  _connectivity = connectivity,
        _logger = logger;

  Future<bool> getInternetStatus() async{
    try{
      final connectivityResult = await _connectivity.checkConnectivity();
      final bool isConnect =
          connectivityResult.contains(ConnectivityResult.wifi) ||
              connectivityResult.contains(ConnectivityResult.ethernet) ||
              connectivityResult.contains(ConnectivityResult.mobile);
      return isConnect;
    }
    catch(e, s){
      _logger.show(where: 'CommonFunc', e: e, s: s);
      return false;
    }
  }

  int fullAgeFromBirth(String birth, {DateTime? today}) {
    try {
      final cleaned = birth.replaceAll(RegExp(r'[^0-9]'), '');

      final DateTime birthDate;
      if (cleaned.length == 6) {
        final yy    = int.parse(cleaned.substring(0, 2));
        final year  = yy <= DateTime.now().year % 100 ? 2000 + yy : 1900 + yy;
        final month = int.parse(cleaned.substring(2, 4));
        final day   = int.parse(cleaned.substring(4, 6));
        birthDate   = DateTime(year, month, day);
      } else if (cleaned.length == 8) {
        final year  = int.parse(cleaned.substring(0, 4));
        final month = int.parse(cleaned.substring(4, 6));
        final day   = int.parse(cleaned.substring(6, 8));
        birthDate   = DateTime(year, month, day);
      } else {
        return 0;
      }

      final now = today ?? DateTime.now();
      if (birthDate.isAfter(now)) return 0;

      final age = now.year - birthDate.year;
      final hasNotHadBirthday = now.month < birthDate.month ||
          (now.month == birthDate.month && now.day < birthDate.day);

      return (age - (hasNotHadBirthday ? 1 : 0)).clamp(0, 999);
    } catch (_) {
      return 0;
    }
  }


}