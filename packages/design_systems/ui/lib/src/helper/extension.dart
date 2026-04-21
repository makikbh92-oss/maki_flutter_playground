import 'package:ui/src/common.dart';

extension WidgetExt on Widget {

  Widget scaleDown({Alignment alignment = Alignment.center}) =>
      FittedBox(fit: BoxFit.scaleDown, alignment: alignment, child: this);


}