import 'package:domain/src/common.dart';

class ProfileEntity {
  final String childId;
  final String hospitalId;
  final String name;
  final String age;
  final String gender;
  final String photo;
  final DadadocHospital? myHospital;

  const ProfileEntity({
    this.childId = '',
    this.hospitalId = '',
    this.name = '',
    this.age = '',
    this.gender = '',
    this.photo = '',
    this.myHospital,
  });
}