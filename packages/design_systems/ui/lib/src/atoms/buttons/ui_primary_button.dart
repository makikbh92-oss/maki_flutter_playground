import 'package:ui/src/common.dart';

class UiPrimaryButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  final bool enabled;
  final bool useDebounce;
  final AlignmentGeometry? alignment;
  final String text;
  final String? textDisabled;

  const UiPrimaryButton({super.key,
    required this.onPressed,
    this.enabled = true,
    this.useDebounce = false,
    required this.text,
    this.alignment,
    this.textDisabled,
  });

  @override
  Widget build(BuildContext context) {
    final DsSize dsSize = Theme.of(context).extension<DsSize>()!;
    final DsColor dsColor = Theme.of(context).extension<DsColor>()!;

    return UiButton(
        height: dsSize.primaryButtonNav,
        width: dsSize.widthCommon,
        onPressed: onPressed,
        alignment: alignment,
        useDebounce: useDebounce,
        padding: EdgeInsets.symmetric(
          horizontal: dsSize.spacing16,
        ),
        enabled: enabled,
        color: enabled ? dsColor.primary : dsColor.disabled,
        child: UiText.buttonLarge(
          text: enabled ? text : textDisabled ?? text, color: enabled ? dsColor.onPrimary : dsColor.onDisabled
        ).scaleDown()
    );
  }


}



