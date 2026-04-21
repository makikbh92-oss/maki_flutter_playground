import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ds_color.dart';
import 'ds_func.dart';
import 'ds_size.dart';
import 'ds_style.dart';


class DsTheme {
  final DsColor dsColor;
  final DsSize dsSize;
  final DsFunc dsFunc;

  final ThemeData data;

  // final ThemeData themeDark;
  DsTheme({
    required this.dsColor,
    required this.dsSize,
    required this.dsFunc,

  }) : data =  ThemeData(
    useMaterial3: false,
    extensions: <ThemeExtension<dynamic>>[
      dsColor,
      dsSize,
      dsFunc,
      DsStyle(color: dsColor, size: dsSize),
    ],
    primaryColor: dsColor.primary,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      toolbarHeight: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark, // Android
        statusBarBrightness: Brightness.light, // iOS
      ),
      backgroundColor: Colors.transparent,
      surfaceTintColor:  Colors.transparent,
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: dsColor.surface,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(dsSize.radius))
      ),
    ),
  );



}