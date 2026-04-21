

import 'package:ui/src/common.dart';

class UiHospitalTimeDialog extends StatelessWidget {
  final List<DayHours> businessHours;
  final String hospitalName;
  const UiHospitalTimeDialog({
    super.key,
    required this.businessHours,
    required this.hospitalName,
  });

  @override
  Widget build(BuildContext context) {
    final DsSize dsSize = Theme.of(context).extension<DsSize>()!;
    final DsColor dsColor = Theme.of(context).extension<DsColor>()!;
    final DsFunc dsFunc = Theme.of(context).extension<DsFunc>()!;
    final List<({bool? isOpen, String status, String time, String day, bool isToday})> scheduleList = dsFunc.getScheduleList(businessHours);
    return Dialog(
      backgroundColor: dsColor.onPrimary,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(dsSize.spacing8))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const UiPad(type: PadType.height24),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: dsSize.spacing24
            ),
            child: UiText.header(
              text: hospitalName,
            ),
          ),
          const UiPad(type: PadType.height16),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: dsSize.spacing24
            ),
            child: UiText.title(
                text: '진료 시간',
                fontWeight: FontWeight.w600,
            ),
          ),
          const UiPad(type: PadType.height24),
          const UiPad(type: PadType.height8),
          Padding(
            padding: (EdgeInsets.symmetric(horizontal: dsSize.spacing24)),
            child: SizedBox(
              width: dsSize.widthCommon,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: scheduleList.map((e) =>
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: dsSize.spacing56+dsSize.spacing16,
                              child: UiText.body(
                                text: e.day,
                                color: dsColor.activated,
                              ),
                            ),
                            const UiPad(type: PadType.width24),
                            Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  UiIcon(icon: Icons.access_time_outlined, color: e.time.isEmpty
                                      ? Colors.red :  Colors.green
                                    // e.$2 ? Colors.green : cssColor.iconSub,
                                  ),
                                  const UiPad(type: PadType.width4),
                                  e.time.isEmpty
                                      ?
                                  UiText.body(
                                    text: '휴진',
                                    color: Colors.red,
                                  )
                                      :
                                  Expanded(
                                    child: FittedBox(
                                        alignment: Alignment.centerLeft,
                                        fit: BoxFit.scaleDown,
                                        child: UiText.body(
                                          text: e.time,
                                          fontWeight: e.isOpen == true ? FontWeight.w700 : FontWeight.w500,
                                          color: e.time.isEmpty ? Colors.red : e.isOpen == true ? dsColor.primaryTertiary : dsColor.activated,
                                        )
                                    ),
                                  ),
                                ],
                              ),
                            ),
                             e.isToday == true
                                ?
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const UiPad(type: PadType.width32),
                                UiText.label(
                                  text: e.status,
                                  fontWeight: FontWeight.w500,
                                  color:  e.isOpen == true ? dsColor.activated : dsColor.onSurfaceSecondary,
                                ),
                              ],
                            ) : SizedBox()
                          ],
                        ),
                        const UiPad(type: PadType.height16),
                        const UiPad(type: PadType.height4),
                      ],
                    )
                ).toList(),
              ),
            ),
          ),

          Padding(
            padding:  EdgeInsets.only(
              top: dsSize.spacing32,
              bottom: dsSize.spacing24,
              left: dsSize.spacing24,
              right: dsSize.spacing24,
            ),
            child: const _Button(),
          )
        ],
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button();

  @override
  Widget build(BuildContext context) {
    final DsColor dsColor = Theme.of(context).extension<DsColor>()!;
    return _Detail(
      isDebounce: false,
      buttonText: '확인',
      textColor: dsColor.onPrimary,
      background: dsColor.primary,
    );
  }
}


class _Detail extends StatelessWidget {
  final bool? isDebounce;
  final String buttonText;
  final Color background;
  final Color textColor;

  const _Detail({
    required this.isDebounce,
    required this.buttonText,
    required this.background,
    required this.textColor,

  });

  @override
  Widget build(BuildContext context) {
    final DsSize dsSize = Theme.of(context).extension<DsSize>()!;
    return UiButton(
        height: dsSize.primaryButtonNav,
        useDebounce: isDebounce ?? false,
        color:  background,
        onPressed: (){
          Theme.of(context).extension<DsFunc>()!.closeDialog(context);
        },
        child: Center(
            child: UiText.buttonMedium(text: buttonText,color: textColor,
              fontWeight: FontWeight.bold,
            ))
    );
  }
}