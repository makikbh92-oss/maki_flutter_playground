
import 'package:ui/src/common.dart';


class UiLogoButton extends StatelessWidget {
  final GestureTapCallback onPressed;


  const UiLogoButton({super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final DsSize dsSize = Theme.of(context).extension<DsSize>()!;
    final double iconSize = dsSize.icon;
    final double newWidth = (102.35 / 16.01) * iconSize;
    return UiButton(
      onPressed: onPressed,
      height: dsSize.iconButtonArea,
      width: newWidth,
      child: UiSvgImage(svg: svgLogo, width: newWidth, height: iconSize),
    );
  }
}
