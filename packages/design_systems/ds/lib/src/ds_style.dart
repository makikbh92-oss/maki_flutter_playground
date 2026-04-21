import 'package:flutter/material.dart';

import 'ds_color.dart';
import 'ds_size.dart';


const String family = 'Pretendard';

@immutable
class DsStyle extends ThemeExtension<DsStyle> {
  final DsColor _color;
  final DsSize _size;

  final TextStyle display;
  final TextStyle header;
  final TextStyle title;
  final TextStyle body;
  final TextStyle label;
  final TextStyle caption;
  final TextStyle subTitle;
  final TextStyle buttonLarge;
  final TextStyle buttonMedium;
  final TextStyle buttonSmall;

  DsStyle({
    required DsColor color,
    required DsSize size,
  }) :
        _color = color,
        _size = size,

        display = TextStyle(
          fontFamily: family,
          height: 1.22,
          color: color.onSurface,
          fontWeight: FontWeight.w700,
          fontSize: size.fontDisplay, //27
        ),

        header = TextStyle(
          fontFamily: family,
          height: 1.24,
          color: color.onSurface,
          fontWeight: FontWeight.w700,
          fontSize: size.fontHeader,//21
        ),

        title = TextStyle(
          fontFamily: family,
          height: 1.26,
          color: color.onSurface,
          fontWeight: FontWeight.w500,
          fontSize: size.fontTitle, //19
        ),

        subTitle = TextStyle(
          fontFamily: family,
          height: 1.55,
          color: color.onSurface,
          fontWeight: FontWeight.w500,
          fontSize: size.fontSubTitle, //18
        ),

        body = TextStyle(
            fontFamily: family,
            height: 1.55,
            color: color.onSurface,
            fontWeight: FontWeight.w500,
            fontSize: size.fontBody //16
        ),

        label = TextStyle(
          fontFamily: family,
          height: 1.55,
          color: color.onSurface,
          fontWeight: FontWeight.w500,
          fontSize: size.fontLabel, //14
        ),

        caption= TextStyle(
          fontFamily: family,
          height: 1.55,
          color: color.onSurfaceSecondary,
          fontWeight: FontWeight.w500,
          fontSize: size.fontCaption, //12
        ),

        buttonLarge = TextStyle(
          fontFamily: family,
          color: color.activated,
          fontWeight: FontWeight.w700,
          fontSize: size.fontButtonLarge, //18
        ),

        buttonMedium = TextStyle(
          fontFamily: family,
          color: color.activated,
          fontWeight: FontWeight.w400,
          fontSize: size.fontButtonMedium, //15
        ),

        buttonSmall = TextStyle(
          fontFamily: family,
          color: color.activated,
          fontWeight: FontWeight.w400,
          fontSize: size.fontButtonSmall, //13
        );




  EdgeInsetsGeometry get contentPadding => EdgeInsets.only(
    top: _size.contentPadding17,
    bottom: _size.contentPadding17,
    left: _size.spacing16,
    right: _size.spacing16,
  );


  OutlineInputBorder get textFormFieldBorder => OutlineInputBorder(
    borderSide: BorderSide(
        color: _color.form,
        width: _size.border
    ),
    borderRadius: BorderRadius.all(Radius.circular(_size.radius)),
  );

  @override
  DsStyle copyWith({
    DsColor? color,
    DsSize? size,
  }) {
    return DsStyle(
      color: color ?? _color,
      size: size ?? _size,
    );
  }

  @override
  DsStyle lerp(ThemeExtension<DsStyle>? other, double t) {
    if (other is! DsStyle) return this;
    if (t == 0.0) return this;
    if (t == 1.0) return other;
    return DsStyle(
      color: _color.lerp(other._color, t),
      size: _size.lerp(other._size, t),
    );
  }


}