
import 'package:ui/src/common.dart';

class UiBottomSheet extends StatelessWidget {
  final List<Widget> children;
  const UiBottomSheet({super.key,
    required this.children
  });

  @override
  Widget build(BuildContext context) {
    final DsColor dsColor = Theme.of(context).extension<DsColor>()!;
    return SingleChildScrollView(
      child: Container(
        color: dsColor.surface,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...children,
            const SafeArea(child: _Pad())
          ],
        ),
      ),
    );
  }
}

class _Pad extends StatelessWidget {
  const _Pad();

  @override
  Widget build(BuildContext context) {
    return Theme.of(context).extension<DsFunc>()!.isIos
        ? const SizedBox()
        : const UiPad(type: PadType.height16);
  }

}