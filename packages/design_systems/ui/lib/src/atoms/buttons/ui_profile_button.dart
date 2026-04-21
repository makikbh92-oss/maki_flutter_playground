import 'dart:io';

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:ui/src/common.dart';

enum ThumbNailSizeType {large, medium, small}

class UiProfileButton extends StatelessWidget {
  final GestureTapCallback onPressedImage;
  final GestureTapCallback onPressedIcon;
  final String url;
  final String fileUrl;
  final ThumbNailSizeType thumbNailSizeType;
  final Color? defaultColor;
  final bool? isMain;

  const UiProfileButton._({super.key,
    required this.onPressedImage,
    required this.onPressedIcon,
    required this.url,
    required this.fileUrl,
    required this.thumbNailSizeType,
    this.defaultColor,
    this.isMain,
  });

  @override
  Widget build(BuildContext context) {
    final DsSize dsSize = Theme.of(context).extension<DsSize>()!;
    final DsColor dsColor = Theme.of(context).extension<DsColor>()!;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        UiCard(
          shape: BoxShape.circle,
          padding: EdgeInsets.all(dsSize.border),
          child: UiButton(
              onPressed: onPressedImage,
              boxShape: BoxShape.circle,
              child: Stack(
                children: [
                  _UiImage.profile(
                    url: url,
                    fileUrl: fileUrl,
                    defaultColor: defaultColor,
                    thumbNailSizeType: thumbNailSizeType,
                  ),
                  defaultColor != null
                      ?
                  Positioned(
                      top: 0,
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: UiIcon(icon: Icons.add, color: dsColor.onPrimary, size: dsSize.spacing32,)
                  ) : const SizedBox()
                ],
              )
          ),
        ),

      ],
    );
  }

  factory UiProfileButton.large({
    Key? key,
    required GestureTapCallback onPressedImage,
    required GestureTapCallback onPressedIcon,
    required String url,
    required String fileUrl,
    Color? defaultColor,
    bool? isMain,
  }) => UiProfileButton._(
      key: key,
      onPressedImage: onPressedImage,
      onPressedIcon: onPressedIcon,
      url: url,
      fileUrl: fileUrl,
      defaultColor: defaultColor,
      isMain: isMain,
      thumbNailSizeType: ThumbNailSizeType.large
  );

  factory UiProfileButton.medium({
    Key? key,
    required GestureTapCallback onPressed,
    required String url,
  }) => UiProfileButton._(
      key: key,
      onPressedImage: onPressed,
      onPressedIcon: onPressed,
      url: url,
      fileUrl: '',
      thumbNailSizeType: ThumbNailSizeType.medium
  );

  factory UiProfileButton.small({
    Key? key,
    required GestureTapCallback onPressed,
    required String url,
  }) => UiProfileButton._(
      key: key,
      onPressedImage: onPressed,
      onPressedIcon: onPressed,
      url: url,
      fileUrl: '',
      thumbNailSizeType: ThumbNailSizeType.small
  );

}




class _Card extends StatelessWidget {
  final ThumbNailSizeType type;
  const _Card({
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    final DsSize dsSize = Theme.of(context).extension<DsSize>()!;
    final double buttonSize = dsSize.spacing32;
    return UiCard(
        color: Theme.of(context).extension<DsColor>()!.primary,

        child: SizedBox(
            width: buttonSize,
            height: buttonSize,
            child: Padding(
              padding: EdgeInsets.all(
                  dsSize.spacing8
              ),
              child: UiIcon(
                icon: Icons.star,
                size: buttonSize,
              ).scaleDown(alignment: Alignment.center),
            ))
    );
  }
}

class _UiCardButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  final bool useDebounce;
  final bool useColor;
  final bool useWidth;
  final bool useBoxShadow;
  final bool useBorder;
  final bool isSection;
  final BoxShape shape;
  final EdgeInsets? padding;
  final Color? color;
  final BorderRadius? borderRadius;
  final Widget child;
  const _UiCardButton({super.key,
    required this.onPressed,
    this.useDebounce = false,
    this.useBoxShadow = true,
    this.useColor = false,
    this.useWidth = false,
    this.useBorder = false,
    this.isSection = false,
    this.padding,
    this.color,
    this.shape = BoxShape.rectangle,
    this.borderRadius,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final DsSize dsSize = Theme.of(context).extension<DsSize>()!;
    final BorderRadius effectiveRadius = borderRadius ?? BorderRadius.circular(dsSize.radius);
    return GestureDetector(
        onTap: context.dsFunc.debounceButton(callback: onPressed),
        child: UiCard(
          shape: BoxShape.circle,
          padding: padding,
          color: color,
          borderRadius: effectiveRadius,
          child: child,
        )
    );
  }
}



class _UiImage extends StatelessWidget {
  final String url;
  final String fileUrl;
  final Size? size;
  final BoxFit fit;
  final BoxShape shape;
  final ThumbNailSizeType thumbNailSizeType;
  final FilterQuality filterQuality;
  final ColorFilter? colorFilter;
  final Widget? placeholder;
  final Widget? error;
  final Color? defaultColor;
  const _UiImage._({super.key,
    required this.url,
    this.fileUrl = '',
    this.size,
    this.fit = BoxFit.cover,
    this.shape = BoxShape.circle,
    this.thumbNailSizeType = ThumbNailSizeType.large,
    this.filterQuality = FilterQuality.low,
    this.colorFilter,
    this.placeholder,
    this.error,
    this.defaultColor,
  });

  @override
  Widget build(BuildContext context) {
    final DsSize dsSize = Theme.of(context).extension<DsSize>()!;
    final Size adjustSize = switch(shape){
      BoxShape.circle => switch(thumbNailSizeType){
        ThumbNailSizeType.large => Size(dsSize.thumbnailLarge, dsSize.thumbnailLarge),
        ThumbNailSizeType.medium =>  Size(dsSize.thumbnailMedium, dsSize.thumbnailMedium),
        ThumbNailSizeType.small =>  Size(dsSize.thumbnailSmall, dsSize.thumbnailSmall),
      },
      BoxShape.rectangle => size ?? const Size(0, 0),
    };
    final Widget image = fileUrl.isEmpty
        ?
    _Image(
        url: url, size: adjustSize, fit: fit, filterQuality: filterQuality, colorFilter: colorFilter,
        shape: shape,
        defaultColor: defaultColor,
        placeholder: placeholder, error: error)
        : _FileImage(fileUrl: fileUrl, fit: fit, size: adjustSize);

    return switch(shape){
      BoxShape.circle => _ClipOval(
        child: image,
      ),
      BoxShape.rectangle => _ClipRRect(
          child: image
      )
    };
  }


  factory _UiImage.profile({
    Key? key,
    required String url,
    required String fileUrl,
    required ThumbNailSizeType thumbNailSizeType,
    Color? defaultColor,
  }) => _UiImage._(key: key, url: url, fileUrl: fileUrl, thumbNailSizeType: thumbNailSizeType, defaultColor: defaultColor,);

}



class _Image extends StatelessWidget {
  final String url;
  final Size size;
  final BoxFit fit;
  final BoxShape shape;
  final FilterQuality filterQuality;
  final ColorFilter? colorFilter;
  final Widget? placeholder;
  final Widget? error;
  final Color? defaultColor;
  const _Image({
    required this.url,
    required this.size,
    required this.fit,
    required this.filterQuality,
    required this.shape,
    required this.colorFilter,
    required this.placeholder,
    required this.error,
    required this.defaultColor,
  });

  @override
  Widget build(BuildContext context) {
    final DsColor dsColor = Theme.of(context).extension<DsColor>()!;
    final DsSize dsSize = Theme.of(context).extension<DsSize>()!;
    return
      url.isEmpty
          ? Container(
        decoration: BoxDecoration(
            color: defaultColor ?? dsColor.form,
            shape: shape,
            borderRadius: shape == BoxShape.circle ? null : BorderRadius.circular(dsSize.radius)
        ),
        width: size.width,
        height: size.height,
      )
          :
      CachedNetworkImage(
        imageUrl: url,
        width: size.width,
        height: size.height,
        // cacheHeight: (height * MediaQuery.of(context).devicePixelRatio).round(),
        // cacheWidth: (width * MediaQuery.of(context).devicePixelRatio).round(),
        filterQuality: filterQuality,
        fit: fit,
        // frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        //   if (wasSynchronouslyLoaded) {
        //     return child;
        //   }
        //   return AnimatedOpacity(
        //     opacity: frame == null ? 0 : 1,
        //     duration: const Duration(milliseconds: 200),
        //     curve: Curves.easeOut,
        //     child: child,
        //   );
        // },
        placeholder: (context, _)  => SizedBox(
          width: size.width,
          height: size.height,
          child: Center(
            child: CircularProgressIndicator(
              color: dsColor.primary,
              strokeWidth: dsSize.spacing4,
            ),
          ),
        ),
        errorBuilder: (context, _, _) => error ?? Container(
          decoration: BoxDecoration(
              color: defaultColor ?? dsColor.form,
              shape: shape,
              borderRadius: shape == BoxShape.circle ? null : BorderRadius.circular(dsSize.radius)
          ),
          width: size.width,
          height: size.height,
        ),
      );
  }
}


class _FileImage extends StatelessWidget {
  final String fileUrl;
  final BoxFit fit;
  final Size size;
  const _FileImage({
    required this.fileUrl,
    required this.fit,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Image.file(
      File(fileUrl),
      fit: BoxFit.cover,
      width: size.width,
      height: size.height,
    );
  }
}


class _ClipOval extends StatelessWidget {

  final Widget child;
  const _ClipOval({

    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: child,
    );
  }
}

class _ClipRRect extends StatelessWidget {

  final Widget child;
  const _ClipRRect({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final DsSize dsSize = Theme.of(context).extension<DsSize>()!;

    return ClipRRect(
      borderRadius: BorderRadius.circular(dsSize.radius),
      child: child,
    );
  }
}