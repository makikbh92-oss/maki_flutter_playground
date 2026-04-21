import 'package:ui/src/common.dart';

class UiBottomNavigationButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  final bool enabled;
  final String text;
  final String? textDisabled;
  final bool useDebounce;
  final bool? useStrong;
  const UiBottomNavigationButton({super.key,
    required this.onPressed,
    required this.text,
    this.enabled = true,
    this.useDebounce = false,
    this.textDisabled,
    this.useStrong,
  });

  @override
  Widget build(BuildContext context) {
    final DsSize dsSize = Theme.of(context).extension<DsSize>()!;
    final double defaultSize = dsSize.spacing4;
    final double paddingSize = dsSize.spacing24;
    return SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: paddingSize
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: paddingSize,
                ),
                UiPrimaryButton(
                  onPressed: onPressed,
                  text: text,
                  enabled: enabled,
                  textDisabled: textDisabled ?? text,
                  useDebounce: useDebounce,
                ),
                SizedBox(
                  height: (MediaQuery.of(context).viewPadding.bottom > 0
                          ? defaultSize
                          : paddingSize
                        ),
                )
              ],
            ),
        )
    );
  }


}
