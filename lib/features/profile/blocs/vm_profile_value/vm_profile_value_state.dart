part of 'vm_profile_value_bloc.dart';

final class VmProfileValueState extends Equatable {
  final String currentImage;
  final String name;
  final String birth;
  final String sex;
  final String height;
  final String weight;

  const VmProfileValueState({
    this.currentImage = '',
    this.name = '',
    this.birth = '',
    this.sex = '',
    this.height = '',
    this.weight = ''
  });

  VmProfileValueState copyWith({
    String? currentImage,
    String? name,
    String? birth,
    String? sex,
    String? height,
    String? weight,
  }) => VmProfileValueState(
      currentImage: currentImage ?? this.currentImage,
      name: name ?? this.name,
      birth: birth ?? this.birth,
      sex: sex ?? this.sex,
      height: height ?? this.height,
      weight: weight ?? this.weight
  );

  bool get enabledCreate => name.isNotEmpty && birth.isNotEmpty && sex.isNotEmpty && height.isNotEmpty && weight.isNotEmpty;
  bool get enabledUpdate => enabledCreate;

  @override
  List<Object> get props => [
    currentImage,
    name,
    birth,
    sex,
    height,
    weight
  ];

}
