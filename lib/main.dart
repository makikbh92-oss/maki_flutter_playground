import 'package:flutter/material.dart';
import 'package:maki_flutter_playground/bootstrap/modules/bootstrap_start.dart';
import 'package:third_party/third_party.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await bootstrapStart(prefs);
}
