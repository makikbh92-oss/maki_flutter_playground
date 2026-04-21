import 'package:ui/src/common.dart';

class UiFormButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  final String? svg;
  final String hintText;
  final String text;
  final bool? isBorder;
  final Alignment alignment;
  const UiFormButton({super.key,
    required this.onPressed,
    required this.hintText,
    required this.text,
    this.svg,
    this.isBorder,
    this.alignment = Alignment.centerLeft
  });

  @override
  Widget build(BuildContext context) {
    final DsSize dsSize = Theme.of(context).extension<DsSize>()!;
    final DsColor dsColor = Theme.of(context).extension<DsColor>()!;
    return Stack(
      children: [
        UiTextFormField.none(),
        Positioned.fill(
            child: UiButton(
                onPressed: onPressed,
                padding: EdgeInsets.symmetric(
                    horizontal: dsSize.spacing16
                ),
                color: isBorder == true ? dsColor.surface : dsColor.form,
                alignment: alignment,
                child:  text.isEmpty
                    ? UiText.body(text: hintText, color: dsColor.hint,)
                    :
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: UiText.body(
                          text: text,
                          overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const UiPad(type: PadType.width32)
                  ],
                )
            )
        ),
        Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            child: svg != null ? GestureDetector(
              onTap: onPressed,
              child: SizedBox(
                  width: dsSize.iconFormButtonArea,
                  child: Center(child: UiIcon(svg: svg!, size: dsSize.spacing16, color: dsColor.activated,))),
            ) :const SizedBox()
        )
      ],
    );
  }
}


class UiFormLabelButton extends StatelessWidget {
  final String? svg;
  final String label;
  final GestureTapCallback onPressed;
  final String hintText;
  final String text;
  final bool? isBorder;
  final Alignment alignment;
  const UiFormLabelButton({super.key,
    this.svg,
    required this.label,
    required this.onPressed,
    required this.hintText,
    required this.text,
    this.isBorder,
    this.alignment = Alignment.centerLeft
  });

  @override
  Widget build(BuildContext context) {
    final DsSize dsSize = Theme.of(context).extension<DsSize>()!;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: dsSize.spacing4, bottom: dsSize.spacing8),
          child: UiText.label(text: label),
        ),
        UiFormButton(onPressed: onPressed, hintText: hintText, text: text, svg: svg,)
      ],
    );
  }
}
