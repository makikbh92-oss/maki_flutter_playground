import 'package:ui/src/common.dart';

class UiFormRowLabel extends StatelessWidget {
  final String label;
  final Widget child;
  const UiFormRowLabel({super.key,
    required this.label,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
            fit: FlexFit.tight,
            flex: 3,
            child:  UiText.label(text: label).scaleDown(alignment: Alignment.centerLeft)
        ),
        const UiPad(type: PadType.width24),
        Flexible(
            fit: FlexFit.tight,
            flex: 7,
            child: child
        )
      ],
    );
  }
}
