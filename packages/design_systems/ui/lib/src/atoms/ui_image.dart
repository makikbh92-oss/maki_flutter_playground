

import 'dart:developer';

import 'package:ui/src/common.dart';

enum ImageSize {
  small,
  medium,
  large,
}

class UiImage extends StatelessWidget {
  final String url;
  final Size? size;
  final ImageSize imageSize;
  final BoxFit? fit;
  final bool useBorderRadius;


  const UiImage({
    super.key,
    required this.url,
    this.size,
    this.imageSize = ImageSize.large,
    this.fit = BoxFit.cover,
    this.useBorderRadius = true,
  });


  @override
  Widget build(BuildContext context) {
    final DsSize dsSize = context.dsSize;
    final BorderRadius borderRadius = useBorderRadius ? BorderRadius.circular(dsSize.spacing8) :  BorderRadius.zero;
    final Size ex = size ?? switch(imageSize){
      ImageSize.small => Size(dsSize.thumbnailSmall, dsSize.thumbnailSmall),
      ImageSize.medium => Size(dsSize.thumbnailMedium, dsSize.thumbnailMedium),
      ImageSize.large => Size(dsSize.thumbnailLarge, dsSize.thumbnailLarge),
    };
    return ClipRRect(
      borderRadius: borderRadius,
      child: Image.asset(
        url,
        width: ex.width,
        height: ex.height,
        fit: fit,
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          if (wasSynchronouslyLoaded || frame != null) return child;

          return SizedBox(
            height: ex.height,
            width: ex.width,
            child: Center(
              child: CircularProgressIndicator(
                color: context.dsColor.primary,
              ),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          log(error.toString());
          return Container(
            decoration: BoxDecoration(
              color: context.dsColor.border,
              borderRadius: borderRadius,
            ),
            width: ex.width,
            height: ex.height,
          );
        },
      ),
    );
  }

  factory UiImage.small({
    Key? key,
    required String url,
  }) => UiImage(
    key: key,
    url: url,
    imageSize: ImageSize.small,
  );

  factory UiImage.medium({
    Key? key,
    required String url,
  }) => UiImage(
    key: key,
    url: url,
    imageSize: ImageSize.medium,
  );

  factory UiImage.large({
    Key? key,
    required String url,
  }) => UiImage(
    key: key,
    url: url,
    imageSize: ImageSize.large,
  );

  factory UiImage.size({
    Key? key,
    required String url,
    required Size size,
  }) => UiImage(
    key: key,
    url: url,
    size: size,
    fit: BoxFit.contain,
    useBorderRadius: false,
  );

}
