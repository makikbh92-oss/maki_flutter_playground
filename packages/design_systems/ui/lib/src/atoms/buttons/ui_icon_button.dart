

import 'package:ui/src/common.dart';


class UiIconButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  final IconData? icon;
  final String? svg;
  final Color? buttonColor;
  final Color? iconColor;
  final bool useDebounce;
  final bool isForm;
  final bool enabled;


  const UiIconButton({super.key,
    required this.onPressed,
    this.icon,
    this.svg,
    this.buttonColor,
    this.iconColor,
    this.useDebounce = false,
    this.isForm = false,
    this.enabled = true,

  });

  @override
  Widget build(BuildContext context) {
    final DsSize dsSize = Theme.of(context).extension<DsSize>()!;
    final double size = switch(isForm){
      true => dsSize.iconFormButtonArea,
      false => dsSize.iconButtonArea,
    };
    return UiButton(
        onPressed: onPressed,
        useDebounce: useDebounce,
        enabled: enabled,
        color: buttonColor,
        height: size,
        width: size,
        child: UiIcon(
          icon: icon,
          svg: svg,
          enabled: enabled,
          isForm: isForm,
          color: iconColor,
        )
    );
  }

}
