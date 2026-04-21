import 'package:core/consts/path.dart';
import 'package:flutter/material.dart';
import 'package:maki_flutter_playground/bootstrap/bootstrap.dart';


class GoRouterPath {
  const GoRouterPath();

  void _push({
    required BuildContext context,
    required String name,
    Map<String, dynamic>? queryParameters,
    Object? extra
  }) =>
      context.pushNamed(name, queryParameters: queryParameters ?? const <String, dynamic>{}, extra: extra);


  Future<T?> _pushResult<T>({
    required BuildContext context,
    required String name,
    Map<String, dynamic>? queryParameters,
    Object? extra
  }) async  =>
      await context.pushNamed<T?>(name, queryParameters: queryParameters ?? const <String, dynamic>{}, extra: extra);



  Future<DadadocHospital?> hospitalSelectPagePushResult(BuildContext context) async =>
      await _pushResult(
        context: context,
        name: nameHospitalSelectPage,
      );

  Future<DadadocHospital?> hospitalDetailPagePushResult({required BuildContext context, required DadadocHospital hospital, required bool isMy}) async =>
      await _pushResult(
        context: context,
        name: nameHospitalDetailPage,
        extra: GoRouterData<({bool isMy, DadadocHospital hospital})>(
            (isMy: isMy, hospital: hospital)
        ),
      );

   void profilePush(BuildContext context) =>
       _push(
        context: context,
        name: nameProfilePage,
      );

}