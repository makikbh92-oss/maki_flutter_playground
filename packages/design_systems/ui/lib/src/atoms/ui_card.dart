import 'package:ui/src/common.dart';


class UiCard extends StatelessWidget {
  final EdgeInsets? padding;
  final Color? color;
  final String? imageUrl;
  final BoxShape shape;
  final BorderRadiusGeometry? borderRadius;
  final Border? border;
  final Widget child;

  const UiCard({super.key,
    this.padding,
    this.color,
    this.imageUrl,
    this.borderRadius,
    this.border,
    this.shape = BoxShape.rectangle,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final DsSize dsSize = context.dsSize;
    return Container(
      decoration: BoxDecoration(
        border: border,
        boxShadow: [
          const BoxShadow(
            color: Colors.black12,
            blurRadius: 1,
            offset: Offset(0,0.5),
          ),
          const BoxShadow(
            color: Colors.white70,
            blurRadius: 1,
            offset: Offset(0,-0.5),
          ),
        ],
        shape: shape,
        color: imageUrl != null ? Colors.transparent : color,
        borderRadius: shape == BoxShape.rectangle ? borderRadius ?? BorderRadius.circular(dsSize.radius) : null,
        image: imageUrl != null ? DecorationImage(
          image: AssetImage(imageUrl!),
          fit: BoxFit.fill,
        ) : null,
      ),
      padding: padding,
      child: child,
    );
  }
}
