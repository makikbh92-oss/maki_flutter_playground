import 'package:ui/src/common.dart';

import '../../ui.dart';

class UiHospitalTime extends StatelessWidget {
  final GestureTapCallback onPressedMoreVert;
  final String hospitalName;
  final List<DayHours> businessHours;
  final String? breakTimeHtml;
  final bool onlyTime;

  const UiHospitalTime({super.key,
    required this.onPressedMoreVert,
    required this.hospitalName,
    required this.businessHours,
    required this.breakTimeHtml,
    this.onlyTime = false,
  });

  @override
  Widget build(BuildContext context) {
    final DsColor dsColor = context.dsColor;
    final DsSize dsSize = context.dsSize;
    final DsFunc dsFunc = Theme.of(context).extension<DsFunc>()!;
    final ({bool? isOpen, String status, String time, String day, bool isToday}) convertHours = dsFunc.getBusinessHoursText(businessHours: businessHours);
    final DateTime now = DateTime.now();

    return onlyTime
        ?
    _Time(
      onPressedMoreVert: onPressedMoreVert,
      businessHours: businessHours,
      breakTimeHtml: breakTimeHtml,
    )
        : UiLayout(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                UiIcon(
                  svg: svgCalendarClock,
                  size: dsSize.spacing32,
                  color: dsColor.activated,
                ),
                const UiPad(type: PadType.width8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UiText.label(text: '${now.year}년', fontWeight: FontWeight.w500, color: dsColor.onCancel,),
                    const UiPad(type: PadType.height2),
                    UiText.header(text: '${now.month}월 ${now.day}일, ${convertHours.day}', fontWeight: FontWeight.w500,),
                  ],
                )
              ],
            ),
            const UiPad(type: PadType.height8),
            UiText.title(text: hospitalName, fontWeight: FontWeight.w700,),
            const UiPad(type: PadType.height16),
            _Time(
              onPressedMoreVert: onPressedMoreVert,
              businessHours: businessHours,
              breakTimeHtml: breakTimeHtml,
            ),

          ],
        )
    );
  }
}



class _Time extends StatelessWidget {
  final GestureTapCallback onPressedMoreVert;
  final List<DayHours> businessHours;
  final String? breakTimeHtml;
  const _Time({
    required this.onPressedMoreVert,
    required this.businessHours,
    required this.breakTimeHtml,
  });

  @override
  Widget build(BuildContext context) {
    final DsColor dsColor = context.dsColor;
    final DsSize dsSize = context.dsSize;
    final DsFunc dsFunc = Theme.of(context).extension<DsFunc>()!;
    final ({bool? isOpen, String status, String time, String day, bool isToday}) convertHours = dsFunc.getBusinessHoursText(businessHours: businessHours);
    final Color textColor = convertHours.isOpen == null ? Colors.red : convertHours.isOpen == true ? dsColor.primaryTertiary : dsColor.onSurface;
    return Column(
      children: [
        Container(
          width: dsSize.widthCommon,
          decoration: BoxDecoration(
              color: dsColor.border,
              borderRadius: BorderRadius.circular(dsSize.spacing8)
          ),
          padding: EdgeInsets.only(
            left: dsSize.spacing16,
            top: dsSize.spacing4,
            bottom: dsSize.spacing4,
            right:dsSize.spacing4,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UiText.label(text: '진료 시간', fontWeight: FontWeight.w500,),
              Row(
                children: [
                  UiIcon(
                    size: dsSize.fontBody,
                    icon: Icons.history_toggle_off_sharp,
                    color: convertHours.isOpen == true ? dsColor.primaryTertiary : dsColor.activated,
                  ),
                  const UiPad(type: PadType.width8),
                  UiText.body(
                    text: convertHours.isOpen == null ? '휴진' : convertHours.time,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                  const UiPad(type: PadType.width4),
                  UiIconButton(onPressed: onPressedMoreVert, icon: Icons.more_vert,)
                ],
              )
            ],
          ),
        ),
        _BreakTime(
          breakTimeHtml: breakTimeHtml,
        )
      ],
    );
  }
}


class _BreakTime extends StatelessWidget {
  final String? breakTimeHtml;
  const _BreakTime({
    required this.breakTimeHtml
  });

  @override
  Widget build(BuildContext context) {
    final DsSize dsSize = context.dsSize;
    return   breakTimeHtml != null
        ?
    Padding(
      padding: EdgeInsets.only(
          top: dsSize.spacing8
      ),
      child: Html(
        data: breakTimeHtml,
      ),
    ) : const SizedBox();
  }
}

