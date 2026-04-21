import 'package:ui/src/atoms/buttons/ui_icon_button.dart';
import 'package:ui/src/atoms/ui_layout.dart';
import 'package:ui/src/common.dart';

class UiSubtitle extends StatelessWidget {
  final String text;
  final String childName;
  final GestureTapCallback onPressedChild;
  final GestureTapCallback onPressedChildren;

  const UiSubtitle({super.key,
    required this.text,
    required this.childName,
    required this.onPressedChild,
    required this.onPressedChildren,

  });

  @override
  Widget build(BuildContext context) {
    final DsSize dsSize = context.dsSize;
    return UiLayout(
        padding: dsSize.paddingWithButton(PaddingReduceType.right),
        useWidth: true,
        child: Row(
          mainAxisAlignment: .spaceBetween,
          crossAxisAlignment: .center,
          children: [
            UiText.title(text: text),
            const UiPad(type: PadType.width16),
            Expanded(
                child: _Button(
                  childName: childName,
                  onPressedChild: onPressedChild,
                  onPressedChildren: onPressedChildren,
                )
            )
          ],
        ),
    );
  }
}

class _Button extends StatelessWidget {
  final String childName;
  final GestureTapCallback onPressedChild;
  final GestureTapCallback onPressedChildren;

  const _Button({
    required this.childName,
    required this.onPressedChild,
    required this.onPressedChildren,
  });

  @override
  Widget build(BuildContext context) {
    final DsSize dsSize = context.dsSize;
    return Row(
      mainAxisAlignment: .end,
      crossAxisAlignment: .center,
      children: [
        UiButton(
            height: dsSize.iconButtonArea,
            onPressed: onPressedChild,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: dsSize.gap,
                ),
                Container(
                  color: Colors.transparent,
                  constraints: BoxConstraints(
                      maxWidth: dsSize.spacing16*9
                  ),
                  child: UiText.body(
                    text: childName,
                    color: context.dsColor.primary,
                    fontWeight: FontWeight.w400,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  width: dsSize.spacing4,
                ),
                const UiIcon(icon: Icons.arrow_drop_down,),

              ],
            )
        ),
        SizedBox(
          width: dsSize.gapVertical,
        ),
        UiIconButton(onPressed: onPressedChildren, icon: Icons.more_vert,)
      ],
    );
  }
}