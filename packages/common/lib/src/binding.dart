import 'package:common/common.dart';

import 'package:provider/single_child_widget.dart';
import 'package:flutter/material.dart';
import 'package:third_party/third_party.dart';

List<SingleChildWidget> commonBinding = [

  RepositoryProvider<CommonLogger>(
      create: (BuildContext context) =>
          CommonLogger(
              logger: Logger(
                printer: PrettyPrinter(),
              )
          )
  ),

  RepositoryProvider<CommonFunc>(
      create: (BuildContext context) =>
          CommonFunc(
              connectivity: Connectivity(),
              logger: context.read<CommonLogger>()
          )
  ),

  RepositoryProvider<CommonErrorHandler>(
      create: (BuildContext context) =>
          CommonErrorHandler(
              commonFunc: context.read<CommonFunc>(),
              commonLogger: context.read<CommonLogger>()
          )
  ),
  
];