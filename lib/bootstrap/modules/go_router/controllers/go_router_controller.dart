import 'package:maki_flutter_playground/bootstrap/bootstrap.dart';
import 'package:flutter/material.dart';


class GoRouterController {
  final GoRouterPath path;
  final GoRouterExtra extra;


  GoRouterController({
    required this.path,
    required this.extra
  });


  void popResult<T>({required BuildContext context, T? result}) => context.pop(result);
  void pop(BuildContext context) => context.pop();


}