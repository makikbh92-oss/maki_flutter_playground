import 'package:flutter/material.dart';
import 'package:ui/ui.dart';
import 'package:flutter/services.dart';
import 'package:core/core.dart';

class MessageDialog {
  const MessageDialog();

  void show({
    bool? barrierDismissible,
    required bool useDebounce,
    required BuildContext routerContext,
    required String title,
    required String? body,
    required String confirmText,
    required GestureTapCallback conFirmOnTap,
    required String cancelText,
    required GestureTapCallback? cancelOnTap,
  }) async{
    await Future.delayed(Duration.zero, () async{
      if (routerContext.mounted) {
        await showDialog<String>(
            context: routerContext,
            barrierDismissible: barrierDismissible ?? true,
            builder: (BuildContext context) =>
                UiBasicDialog(
                  title: title,
                  useDebounce: useDebounce,
                  body: body,
                  confirmText: confirmText,
                  conFirmOnTap: conFirmOnTap,
                  cancelText: cancelText,
                  cancelOnTap: cancelOnTap,

                )
        );
      }
    });
  }


  void dailyScheduleDialog({
    required BuildContext context,
    required String hospitalName,
    required List<DayHours> businessHours,
  }) async{
    await Future.delayed(Duration.zero, () async{
      if (context.mounted) {
        await showDialog<String>(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) =>
                UiHospitalTimeDialog(
                  businessHours: businessHours,
                  hospitalName: hospitalName,
                )
        );
      }
    });
  }


}