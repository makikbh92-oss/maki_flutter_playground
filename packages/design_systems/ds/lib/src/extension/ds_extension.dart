
import 'package:flutter/material.dart';
import '../ds_color.dart';
import '../ds_func.dart';
import '../ds_size.dart';
import '../ds_style.dart';

extension DsExtension on BuildContext {
  DsStyle get dsStyle => Theme.of(this).extension<DsStyle>()!;
  DsColor get dsColor => Theme.of(this).extension<DsColor>()!;
  DsFunc get dsFunc => Theme.of(this).extension<DsFunc>()!;
  DsSize get dsSize => Theme.of(this).extension<DsSize>()!;
}