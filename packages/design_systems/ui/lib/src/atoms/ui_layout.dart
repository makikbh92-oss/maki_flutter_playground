import 'package:ui/src/common.dart';


class UiLayout extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final bool useWidth;
  final Widget child;

  const UiLayout({super.key,
    this.padding,
    this.color,
    this.useWidth = false,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final DsSize dsSize = context.dsSize;
    return Container(
      padding: padding ?? dsSize.paddingDefault,
      color: color ?? Colors.transparent,
      width: switch(useWidth){
        true => dsSize.widthCommon,
        false => null
      },
      child: child,
    );
  }


  factory UiLayout.sizedBox({
    Key? key,
    EdgeInsetsGeometry? padding,
  }) => UiLayout(
      key: key,
      padding: padding,
      useWidth: true,
      child: const SizedBox()
  );


}
