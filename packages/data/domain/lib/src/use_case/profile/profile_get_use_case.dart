import 'package:domain/src/common.dart';
import 'package:third_party/third_party.dart';


class ProfileGetUseCase {
  final CommonErrorHandler _errorHandler;
  final CommonFunc _func;
  final ChildRepository _childRepository;
  final HospitalRepository _hospitalRepository;
  const ProfileGetUseCase({
    required CommonErrorHandler commonErrorHandler,
    required CommonFunc commonFunc,
    required ChildRepository childRepository,
    required HospitalRepository hospitalRepository,
  }) : _errorHandler = commonErrorHandler,
        _func = commonFunc,
        _childRepository = childRepository,
        _hospitalRepository = hospitalRepository;

  Stream<Either<DataError, ProfileEntity>> call({
    required DadadocHospital hospital,
  }) => _errorHandler.domainErrorHandler(
      onRepository: () async{
        final Either<DataError, DadadocChild> getChild = await _childRepository.getChild(hospitalId: hospital.hospitalId);
        final DadadocChild child = getChild.fold((error) => throw error, (value) => value);
        int age = _func.fullAgeFromBirth(child.birth);
        final String ageResult = '(만 $age세)';
        if(hospital.hospitalId.isEmpty){
          return Either.right(ProfileEntity(
            childId: child.childId,
            hospitalId: child.hospitalId,
            name: child.name,
            gender: child.gender ==  'male' ? '남' : '여',
            age: ageResult,
            photo: child.photo,

          ));
        }
        else{
          return Either.right(ProfileEntity(
            childId: child.childId,
            hospitalId: child.hospitalId,
            name: child.name,
            age: ageResult,
            gender: child.gender ==  'male' ? '남' : '여',
            photo: child.photo,
            myHospital: hospital,
          ));
        }


      }
  );

}