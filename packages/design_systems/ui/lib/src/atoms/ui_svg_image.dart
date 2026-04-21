import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui/src/common.dart';

class UiSvgImage extends StatelessWidget {
  final String svg;
  final double width;
  final double height;
  final Color? color;
  const UiSvgImage({super.key,
    required this.svg,
    required this.width,
    required this.height,
    this.color,
  });



  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svg,
      width: width,
      height: height,
      colorFilter: switch(color){
        null => null,
        _ => ColorFilter.mode(color!, BlendMode.srcIn)
      },
    );
  }
}