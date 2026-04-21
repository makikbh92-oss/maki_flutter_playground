import 'package:flutter/material.dart';
import 'package:global/global.dart';
import 'package:third_party/third_party.dart';


extension MyExtension on BuildContext {
  GlobalManager get global => read<GlobalManager>();
}