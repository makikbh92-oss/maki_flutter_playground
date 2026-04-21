import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';
import 'package:service/service.dart';
import 'package:service/src/api/api_client.dart';

import 'package:third_party/third_party.dart';

List<SingleChildWidget> serviceBinding({
  required SharedPreferences prefs,
  required Dio dio,

}) => [
  
  RepositoryProvider<ApiClient>(
      create: (BuildContext context) => ApiClient(
          commonErrorHandler: context.read<CommonErrorHandler>()
      )
  ),
  RepositoryProvider<ThirdPartyApiClient>(
      create: (BuildContext context) => ThirdPartyApiClient(
          commonErrorHandler: context.read<CommonErrorHandler>()
      )
  ),

];