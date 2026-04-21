import 'package:common/common.dart';
import 'package:domain/src/use_case/profile/profile_get_use_case.dart';
import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';
import 'package:repository/repository.dart';

import 'package:third_party/third_party.dart';

List<SingleChildWidget> domainBinding = [

  RepositoryProvider<ProfileGetUseCase>(
      create: (BuildContext context) => ProfileGetUseCase(
          commonErrorHandler: context.read<CommonErrorHandler>()  ,
          commonFunc:  context.read<CommonFunc>(),
          childRepository:  context.read<ChildRepository>(),
          hospitalRepository: context.read<HospitalRepository>()

      )
  ),


];