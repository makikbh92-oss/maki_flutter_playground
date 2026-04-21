import 'package:ui/src/common.dart';

enum TitleColor {
  primaryTertiary, warning, error

}

class UiTelehealthCard extends StatelessWidget {
  final ({GestureTapCallback onPressed, String text, IconData icon})? button;
  final ({TitleColor titleColor, String text}) title;
  final String body;
  const UiTelehealthCard({super.key,
    this.button,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    final DsSize dsSize = context.dsSize;
    final DsColor dsColor = context.dsColor;
    return UiLayout(
      child: UiCard(
        padding: EdgeInsets.all(
          dsSize.spacing24,
        ),
        imageUrl: imageCardLightBlue,
        child: SizedBox(
            width: dsSize.widthCommon,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UiText.title(
                  text: title.text,
                  fontWeight: FontWeight.w700,
                  color: switch(title.titleColor){
                    TitleColor.primaryTertiary => dsColor.primaryTertiary,
                    TitleColor.warning => dsColor.warning,
                    TitleColor.error => dsColor.error,
                  },
                ),
                const UiPad(
                    type: PadType.height16
                ),
                UiText.body(
                  text: body,
                ),
                switch(button){
                  null => const SizedBox(),
                  _ => Column(
                    children: [
                      const UiPad(
                          type: PadType.height24
                      ),
                      _Button(
                        onPressed: button!.onPressed,
                        iconData: button!.icon,
                        text: button!.text,
                      )
                    ],
                  )
                }
              ],
            )
        ),
      ),
    );
  }
}



class _Button extends StatelessWidget {
  final GestureTapCallback onPressed;
  final IconData iconData;
  final String text;
  final Color? color;
  const _Button({
    required this.onPressed,
    required this.iconData,
    required this.text,
    this.color,
  });


  @override
  Widget build(BuildContext context) {
    final DsSize dsSize = context.dsSize;
    final DsColor dsColor = context.dsColor;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        UiCard(
          child: UiButton(
              color: dsColor.onPrimary,
              padding: EdgeInsets.symmetric(
                  horizontal: dsSize.spacing32,
                  vertical: dsSize.spacing16
              ),
              onPressed: onPressed,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      UiIcon(icon: iconData, size: dsSize.fontButtonLarge, color: color ?? dsColor.primary,),
                      const UiPad(type: PadType.width8),
                    ],
                  ),
                  UiText.buttonMedium(text: text, fontWeight: FontWeight.w600, color: color ?? dsColor.primary,)
                ],
              )
          ),
        ),
      ],
    );
  }
}

