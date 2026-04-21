import 'package:ui/src/common.dart';
import 'package:flutter/cupertino.dart';


class UiButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  final bool useDebounce;
  final bool enabled;
  final Color? color;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final double? height;
  final double? width;
  final BoxShape boxShape;
  final Widget child;
  const UiButton({
    super.key,
    required this.onPressed,
    this.useDebounce = false,
    this.color,
    this.alignment,
    this.padding,
    this.height,
    this.width,
    this.boxShape = BoxShape.rectangle,
    this.enabled = true,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final BorderRadius? borderRadius = switch(boxShape){
      BoxShape.rectangle => BorderRadius.circular(context.dsSize.radius),
      BoxShape.circle => null
    };
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: color ?? Colors.transparent,
          borderRadius: borderRadius,
          shape: boxShape
      ),
      child: CupertinoButton(
        minimumSize: const Size(0, 0),
        alignment: alignment ?? Alignment.center,
        disabledColor: Colors.transparent,
        padding: padding ?? EdgeInsets.zero,
        borderRadius: borderRadius,
        color: Colors.transparent, // 이미 Container에서 색상 적용
        onPressed: enabled ? useDebounce ? Theme.of(context).extension<DsFunc>()!.debounceButton(callback: onPressed) : onPressed : null,
        child: child,
      ),
    );
  }
}
