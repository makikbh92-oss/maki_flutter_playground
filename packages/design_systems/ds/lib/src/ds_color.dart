import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';


@immutable
class DsColor extends ThemeExtension<DsColor> {

  final Color primary;
  final Color primarySecondary;
  final Color primaryTertiary;
  final Color primarySurface;

  final Color onPrimary;
  final Color surface;

  final Color success;
  final Color warning;
  final Color error;

  final Color onSurface;
  final Color onSurfaceSecondary;
  final Color cancel;
  final Color onCancel;
  final Color disabled;
  final Color onDisabled;
  final Color activated;
  final Color deactivated;
  final Color border;
  final Color form;
  final Color hint;



  DsColor() :
        // primary = const Color(0xFF00b890),
        // primarySecondary = const Color(0xFFfb8362),
        // primaryTertiary = const Color(0xFFb161bc),

        primary = const Color(0xff495AF2),
        primarySecondary = const Color(0xFF6667AB),
        primaryTertiary = const Color(0xFF3F51B5),
        primarySurface = Color(0xffB6BDFA),

        onPrimary = const Color(0xFFFFFFFF),
        surface = const Color(0xFFFFFFFF),
        onSurface = const Color(0xFF222222),
        onSurfaceSecondary = const Color(0xFF909090),

        cancel = const Color(0xFFf6f6f6),
        onCancel = const Color(0xFF767676),

        disabled = const Color(0xFFd2d2d2),
        onDisabled = const Color(0xFFffffff),

        activated = const Color(0xFF000000),
        deactivated = const Color(0xFF9E9E9E), // Color(0xFFB0B0B0)

        border = const Color(0xFFebebeb), //235,235,235
        form = const Color(0xFFf7f7f7),
        success = const Color(0xff4ac886), //my green
        warning = const Color(0xFFa47864), // mocha mousse
        error = const Color(0xffD0342C),

        hint = const Color(0xFFAAAAAA);
  // buttonSecondary = const Color(0xff939597),
  // buttonTertiary = const Color(0xffC0C0C0),
  //
  //
  // bottomNavOffIcon = const Color(0xffCBCBCB);




  // formSearchSurface = const Color(0xffF0F0F0),   //Flash white

  // Blackened pearl

  @override
  DsColor copyWith() {
    return DsColor();
  }

  @override
  DsColor lerp(ThemeExtension<DsColor>? other, double t) {
    if (other is! DsColor) return this;
    return  DsColor();
  }

}

// @immutable
// class BaseGray {
//   final Color gray900;
//   final Color gray800;
//   final Color gray700;
//   final Color gray600;
//   final Color gray500;
//   final Color gray400;
//   final Color gray300;
//   final Color gray200;
//   final Color gray100;
//   final Color gray50;
//   final Color gray0;
//
//   const BaseGray({
//     required this.gray900,
//     required this.gray800,
//     required this.gray700,
//     required this.gray600,
//     required this.gray500,
//     required this.gray400,
//     required this.gray300,
//     required this.gray200,
//     required this.gray100,
//     required this.gray50,
//     required this.gray0,
//   });
//
//   BaseGray lerp(BaseGray a, BaseGray b, double t) => BaseGray(
//     gray900: gray900,
//     gray800: gray800,
//     gray700: gray700,
//     gray600: gray600,
//     gray500: gray500,
//     gray400: gray400,
//     gray300: gray300,
//     gray200: gray200,
//     gray100: gray100,
//     gray50:  gray50,
//     gray0:   gray0,
//   );
// }
//
// const kBaseGrayLight = BaseGray(
//   gray900: Color(0xFF222222),
//   gray800: Color(0xFF333333),
//   gray700: Color(0xFF444444),
//   gray600: Color(0xFF555555),
//   gray500: Color(0xFF666666),
//   gray400: Color(0xFF8A8A8F),
//   gray300: Color(0xFFA0A0A0),
//   gray200: Color(0xFFD1D1D6),
//   gray100: Color(0xFFF5F5F5),
//   gray50:  Color(0xFFF2F2F7),
//   gray0:   Color(0xFFFFFFFF),
// );
