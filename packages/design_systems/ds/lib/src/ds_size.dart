import 'package:flutter/material.dart';
import 'dart:ui';

enum PaddingReduceType {left, right, both}

@immutable
class DsSize extends ThemeExtension<DsSize> {

  final double widthCommon;
  final double heightCommon;
  final double ratio;
  final double base;
  final double unit;


  final double extendsGap;

  final double border;

  final double fontDisplay;
  final double fontHeader;
  final double fontTitle;
  final double fontSubTitle;
  final double fontBody;
  final double fontLabel;
  final double fontCaption;
  final double fontButtonLarge;
  final double fontButtonMedium;
  final double fontButtonSmall;

  final double spacing1;
  final double spacing2;
  final double spacing4;
  final double spacing8;
  final double spacing12;
  final double spacing16;

  final double spacing24;
  final double spacing32;
  final double spacing40;
  final double spacing48;
  final double spacing56;
  final double spacing64;

  final double tapSide;

  final double contentPadding17;
  final double contentPadding15;

  final double gapHorizontal;
  final double gapVertical;
  final double gap;
  final double gapAppbarTitle;

  final double icon;
  final double iconForm;

  final double radius;

  final double stethoscope;

  final double iconButtonArea;
  final double iconFormButtonArea;
  final double iconProfileButtonArea;
  final double iconFormText;

  final double primaryButtonNav;
  final double primaryButtonNormal;
  final double primaryButtonDialog;

  final double widgetLoading;


  final double thumbnailSmall;
  final double thumbnailMedium;
  final double thumbnailLarge;

  final double ratioHalf;

  final double navbar;
  final EdgeInsetsGeometry paddingDefault;
  final EdgeInsetsGeometry paddingScroll;


  DsSize({
    required this.widthCommon,
    required this.heightCommon,
    required this.base, // 1.000032,
    required this.unit,
    required this.ratio,
  }) :

        extendsGap = base * 0.001,

        border = base*1.3,

        fontDisplay = base*27,
        fontHeader = base*21,
        fontTitle = base*19,
        fontSubTitle = base*18,
        fontBody = base*16,
        fontLabel = base*14,
        fontCaption = base*12,
        fontButtonLarge = base*17,
        fontButtonMedium = base*15,
        fontButtonSmall = base*13,

        spacing1 = base,
        spacing2 = base*2,
        spacing4 = unit,
        spacing8 = unit*2,
        spacing12 = unit*3,
        spacing16 = unit*4,

        spacing24 = unit*6,
        spacing32 = unit*8,
        spacing40 = unit*10,
        spacing48 = unit*12,
        spacing56 = unit*14,
        spacing64 = unit*16,

        tapSide = base*3,

        contentPadding17 = base*17,
        contentPadding15 = base*15,


        gapHorizontal = base*13,
        gapVertical = base*5,
        gap = base*11,
        gapAppbarTitle = base*5,


        icon = base*22,  //22

        iconForm = unit*5, //20

        radius = base*10, //10


        iconButtonArea = unit*11, //48

        iconFormButtonArea = unit*10, // 40
        iconProfileButtonArea = unit*9,
        iconFormText = unit*7,

        primaryButtonNav = unit*15,
        primaryButtonNormal = unit*13,
        primaryButtonDialog = unit*12,

        widgetLoading = unit*7,  //36

        thumbnailSmall = unit*10,

        thumbnailMedium =  unit*16,

        thumbnailLarge = unit*26,

        ratioHalf = ratio/2,

        navbar = unit*17,

        stethoscope = unit*17,

        paddingDefault = EdgeInsets.symmetric(
          horizontal: unit*6,
          vertical: unit*4
        ),

        paddingScroll = EdgeInsets.only(
            right: unit*1,
            bottom: unit*12
        );

  EdgeInsetsGeometry paddingWithButton(PaddingReduceType type) => switch(type){
    PaddingReduceType.both =>
        EdgeInsets.symmetric(
            horizontal: gapHorizontal,
            vertical: gapVertical
        ),
    PaddingReduceType.left =>
        EdgeInsets.only(
            left: gapHorizontal,
            right: paddingDefault.horizontal/2,
            top: gapVertical,
            bottom: gapVertical,
        ),
    PaddingReduceType.right =>
        EdgeInsets.only(
          left: paddingDefault.horizontal/2,
          right: gapHorizontal,
          top: gapVertical,
          bottom: gapVertical,
        ),
  };

  @override
  DsSize copyWith({
    double? widthCommon,
    double? heightCommon,
    double? base,
    double? unit,
    double? ratio,
  }) {
    return DsSize(
      widthCommon: widthCommon ?? this.widthCommon,
      heightCommon: heightCommon ?? this.heightCommon,
      base: base ?? this.base,
      unit: unit ?? this.unit,
      ratio: ratio ?? this.ratio,
    );
  }

  @override
  DsSize lerp(ThemeExtension<DsSize>? other, double t) {
    if (other is! DsSize) return this;
    return DsSize(
        widthCommon: lerpDouble(widthCommon, other.widthCommon, t)!,
        heightCommon: lerpDouble(heightCommon, other.heightCommon, t)!,
        base: lerpDouble(base, other.base, t)!,
        unit: lerpDouble(unit, other.unit, t)!,
        ratio: lerpDouble(ratio, other.ratio, t)!
    );
  }

}
