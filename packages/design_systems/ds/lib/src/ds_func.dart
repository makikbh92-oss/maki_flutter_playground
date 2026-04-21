import 'dart:async';
import 'package:core/core.dart';
import 'package:ds/ds.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:third_party/third_party.dart';

// import 'package:url_launcher/url_launcher.dart';



@immutable
class DsFunc extends ThemeExtension<DsFunc> {
  final bool isIos;
  DsFunc({
    required this.isIos
  });

  final List<TextInputFormatter>? phoneNumberFormatter = [
    FilteringTextInputFormatter.digitsOnly, //숫자만!
    _NumberFormatter(), // 자동하이픈
    LengthLimitingTextInputFormatter(13) //13자리만 입력받도록 하이픈 2개+숫자 11개
  ];
  // deb

  // debounce method

  VoidCallback debounceButton({required VoidCallback callback, int? milliseconds}) {
    Timer? timer;
    return () {
      timer?.cancel();
      timer = Timer(Duration(milliseconds: milliseconds ?? 300), (){
        callback();
        if (timer != null) {
          timer!.cancel();
        }
      });
    };
  }


  // ValueChanged<String> debounceOnField({
  //   required ValueChanged<String> onChanged,
  //   int? milliseconds,
  // }) {
  //   Timer? timer;
  //   String? latestValue;
  //
  //   return (String value) {
  //     latestValue = value;
  //     timer?.cancel();
  //     timer = Timer(Duration(milliseconds: milliseconds ?? 700), () {
  //       onChanged(latestValue!);
  //       timer?.cancel();
  //     });
  //   };
  // }
  
  // hide focus method
  void hideFocus(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  // request focus method
  void requestFocus({required BuildContext context, required FocusNode focusNode}) {
    FocusScope.of(context).requestFocus(focusNode);
  }

  // callback helper method
  void callbackHelper({
    required bool? isForm,
    required void Function()? callback,
    required BuildContext context
  }) {
    if (isForm == true) {
      hideFocus(context);
    }
    if(callback != null){
      callback();
    }
  }

  ({bool? isOpen, String status, String time, String day, bool isToday}) getBusinessHoursText({
    required List<DayHours> businessHours,
    int? targetDayIndex,
  }) {
    final now = DateTime.now();
    final todayIndex = now.weekday % 7;
    final targetIndex = targetDayIndex ?? todayIndex; // 없으면 오늘
    final isToday = targetIndex == todayIndex;

    const dayNames = ['일', '월', '화', '수', '목', '금', '토'];
    final dayLabel = '${dayNames[targetIndex]}요일';

    final target = businessHours
        .where((h) => h.day == targetIndex) // targetIndex로 필터
        .firstOrNull;

    if (target == null || target.start == null) {
      return (isOpen: null, status: '휴진', time: '', day: dayLabel, isToday: isToday);
    }

    final isOpen = isToday ? _isNowOpen(target.start!, target.end!, now) : null;

    return (
    isOpen: isOpen,
    status: isToday ? (isOpen == true ? '진료 중' : '진료 종료') : '',
    time: '${target.start} ~ ${target.end}',
    day: dayLabel,
    isToday: isToday,
    );
  }

  List<({bool? isOpen, String status, String time, String day, bool isToday})> getScheduleList(
      List<DayHours> businessHours,
      ) {
    final now = DateTime.now();
    final todayIndex = now.weekday % 7;
    const dayNames = ['일', '월', '화', '수', '목', '금', '토'];

    final sorted = [...businessHours]..sort((a, b) {
      final aDay = a.day == 0 ? 7 : a.day;
      final bDay = b.day == 0 ? 7 : b.day;
      return aDay.compareTo(bDay);
    });

    return sorted.map((target) {
      final index = target.day;
      final isToday = index == todayIndex;
      final dayLabel = '${dayNames[index]}요일';

      if (target.start == null) {
        return (isOpen: null, status: '휴진', time: '', day: dayLabel, isToday: isToday);
      }

      final isOpen = isToday ? _isNowOpen(target.start!, target.end!, now) : null;
      final status = isToday
          ? (isOpen == true ? '진료 중' : '진료 종료')
          : '진료';

      return (
      isOpen: isOpen,
      status: status,
      time: '${target.start} ~ ${target.end}',
      day: dayLabel,
      isToday: isToday,
      );
    }).toList();
  }

  bool _isNowOpen(String start, String end, DateTime now) {
    final startParts = start.split(':');
    final endParts = end.split(':');

    final startMinutes = int.parse(startParts[0]) * 60 + int.parse(startParts[1]);
    final endMinutes = int.parse(endParts[0]) * 60 + int.parse(endParts[1]);
    final nowMinutes = now.hour * 60 + now.minute;

    return nowMinutes >= startMinutes && nowMinutes < endMinutes;
  }

  void closeDialog(BuildContext context) => Navigator.of(context, rootNavigator: true).pop();

  Future<void> pickDate({
    required BuildContext context,
    required String date,
    required void Function(String) callback,
  }) async {
    {
      final Locale locale = Localizations.localeOf(context);
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      final DateTime initialDate = date.isEmpty ? DateTime.now() : formatter.parse(date);

      final DateTime? dateTime = await showDatePicker(
          locale: locale,
          context: context,
          initialDate: initialDate,
          firstDate: DateTime(1900),
          lastDate: DateTime(2100),
          builder: (context, child) {
            final DsColor dsColor = Theme.of(context).extension<DsColor>()!;
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: dsColor.primary,        // 선택된 날짜, 헤더 배경
                  onPrimary: dsColor.onPrimary,     // 헤더 텍스트
                  surface: dsColor.surface,       // 달력 배경
                  onSurface: dsColor.onSurface,     // 날짜 텍스트
                ),
              ),
              child: child!,
            );
          }
      );
      if(dateTime != null){
        final String result = formatter.format(dateTime);
        callback.call(result);
      }
    }
  }




  @override
  DsFunc copyWith({
    bool? isIos
  }) {
    return DsFunc(
      isIos: isIos ?? this.isIos,
    );
  }

  @override
  DsFunc lerp(ThemeExtension<DsFunc>? other, double t) {
    if (other is! DsFunc) return this;
    return DsFunc(
      isIos: isIos
    );
  }
}





class _NumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex <= 3) {
        if (nonZeroIndex % 3 == 0 && nonZeroIndex != text.length) {
          buffer.write('-'); // Add double spaces.
        }
      } else {
        if (nonZeroIndex % 7 == 0 &&
            nonZeroIndex != text.length &&
            nonZeroIndex > 4) {
          buffer.write('-');
        }
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }



}