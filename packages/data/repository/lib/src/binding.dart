import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';
import 'package:repository/repository.dart';
import 'package:repository/src/child/child_repository_dummy.dart';
import 'package:repository/src/hospital/hospital_repository_dummy.dart';
import 'package:repository/src/profile/profile_repository_remote.dart';



import 'package:service/service.dart';

import 'package:third_party/third_party.dart';

List<SingleChildWidget> repositoryBinding = [

  RepositoryProvider<BlocHelperRepository>(
      create: (BuildContext context) => const BlocHelperRepository()
  ),

  RepositoryProvider<HospitalRepository>(
      create: (BuildContext context) => HospitalRepositoryDummy(
          api: context.read<ApiClient>(),
          commonErrorHandler: context.read<CommonErrorHandler>()
      )
  ),

  RepositoryProvider<ChildRepository>(
      create: (BuildContext context) => ChildRepositoryDummy(
          api: context.read<ApiClient>(),
          commonErrorHandler: context.read<CommonErrorHandler>()
      )
  ),

  RepositoryProvider<ProfileRepository>(
      create: (BuildContext context) => ProfileRepositoryRemote(
          thirdPartyApiClient: context.read<ThirdPartyApiClient>(),
          commonErrorHandler: context.read<CommonErrorHandler>()
      )
  ),

];