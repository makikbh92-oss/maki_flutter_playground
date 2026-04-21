import 'package:ui/src/common.dart';

class UiBottomSheetButton extends StatelessWidget {
  final void Function() callback;
  final IconData? icon;
  final String? svg;
  final Color? textColor;
  final Color? iconColor;
  final String text;
  final bool enabled;
  const UiBottomSheetButton({super.key,
    required this.callback,
    this.svg,
    this.icon,
    this.textColor,
    this.iconColor,
    this.enabled = true,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final DsSize dsSize = Theme.of(context).extension<DsSize>()!;
    final DsColor dsColor = Theme.of(context).extension<DsColor>()!;
    return UiButton(
        enabled: enabled,
        onPressed: (){
          callback.call();
          Theme.of(context).extension<DsFunc>()!.closeDialog(context);
        },
        padding: EdgeInsets.symmetric(
            horizontal: dsSize.spacing24
        ),
        color: dsColor.surface,
        width: dsSize.widthCommon,
        height: dsSize.primaryButtonNormal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                svg == null && icon == null
                ? SizedBox(
                  width: dsSize.fontButtonMedium,
                )
                : UiIcon(
                  svg: svg,
                  icon: icon,
                  color: iconColor ?? dsColor.activated,
                  size: dsSize.fontButtonMedium,
                ),
                const UiPad(type: PadType.width16)
              ],
            ),
            Expanded(
                child: UiText.buttonMedium(
                    text: text,
                    color: textColor ?? dsColor.activated
                ).scaleDown(
                    alignment: Alignment.centerLeft
                )
            )
          ],
        )
    );
  }
}
