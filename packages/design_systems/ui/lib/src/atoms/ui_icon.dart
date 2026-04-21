import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui/src/common.dart';

class UiIcon extends StatelessWidget {
  final IconData? icon;
  final String? svg;
  final double? size;
  final Color? color;
  final bool enabled;
  final bool isForm;

  const UiIcon({super.key,
    this.icon,
    this.svg,
    this.size,
    this.color,
    this.enabled = true,
    this.isForm = false,
  });

  @override
  Widget build(BuildContext context) {
    final DsSize dsSize = context.dsSize;
    final DsColor dsColor = context.dsColor;
    final double iconSize = size ?? (isForm ? dsSize.iconForm : dsSize.icon);
    final Color iconColor = color ?? (enabled ? dsColor.activated : dsColor.deactivated);
    return switch(svg){
      null =>
      switch(icon){
        null => SizedBox(
          width: iconSize,
          height: iconSize,
        ),
        _ =>
            Icon(
              icon,
              size: iconSize,
              color: iconColor,
            )
      },
      _ =>
          SvgPicture.asset(
              svg!,
              width: iconSize,
              height: iconSize,
              colorFilter: ColorFilter.mode(
                  iconColor, BlendMode.srcIn)
          )

    };
  }


  factory UiIcon.nav({
    Key? key,
    required String svg,
    required Color color,
  }) {
    return UiIcon(
      key: key,
      svg: svg,
      color: color,
      isForm: true,
    );
  }


}
