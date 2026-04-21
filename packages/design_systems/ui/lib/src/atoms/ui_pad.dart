import 'package:ui/src/common.dart';


enum PadType { width16, height32, height16, height24, height8, height4, height2, height1, width2, width4, width8, width24, width32, width40, width48, extendsGap}

class UiPad extends StatelessWidget {
  final PadType type;

  const UiPad({super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    final DsSize dsSize = context.dsSize;
    return SizedBox(
      width: switch(type){
        PadType.width48 => dsSize.spacing48,
        PadType.width40 => dsSize.spacing40,
        PadType.width32 => dsSize.spacing32,
        PadType.width24 => dsSize.spacing24,
        PadType.width16 => dsSize.spacing16,
        PadType.width8 => dsSize.spacing8,
        PadType.width4 => dsSize.spacing4,
        PadType.width2 => dsSize.spacing2,
        _ => null
      },
      height: switch(type){
        PadType.height32 => dsSize.spacing32,
        PadType.height24 => dsSize.spacing24,
        PadType.height16 => dsSize.spacing16,
        PadType.height8 => dsSize.spacing8,
        PadType.height4 => dsSize.spacing4,
        PadType.height2 => dsSize.spacing2,
        PadType.height1 => dsSize.spacing1,
        PadType.extendsGap => dsSize.extendsGap,
        _ => null
      },
    );
  }

}
