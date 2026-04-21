class DadadocChild {
  final String childId;
  final String hospitalId;
  final String name;
  final String birth;
  final String residentNumber;
  final String gender;
  final int weight;
  final int height;
  final String photo;


  DadadocChild({
    this.childId = '',
    this.hospitalId = '',
    this.name = '',
    this.birth = '',
    this.residentNumber = '',
    this.gender = '',
    this.weight = 0,
    this.height = 0,
    this.photo = '',
  });

  factory DadadocChild.dummy({required String hospitalId}) {
    return DadadocChild(
      childId: 'childId_001',
      hospitalId: hospitalId,
      name: '김하온',
      birth: '2024-01-15',
      residentNumber: '201010-0000000',
      gender: 'female',
      weight: 10,
      height: 80,
      photo: 'assets/images/demo/child.jpg',
    );
  }



  factory DadadocChild.fromJson(Map<String, dynamic> json) {
    return DadadocChild(
      childId: json['childId'] as String? ?? '',
      hospitalId: json['hospitalId'] as String? ?? '',
      name: json['name'] as String? ?? '',
      birth: json['birth'] as String? ?? '',
      residentNumber: json['residentNumber'] as String? ?? '',
      gender: json['gender'] as String? ?? '',
      weight: (json['weight'] as num?)?.toInt() ?? 0,
      height: (json['height'] as num?)?.toInt() ?? 0,
      photo: json['photo'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'childId': childId,
    'hospitalId': hospitalId,
    'name': name,
    'birth': birth,
    'residentNumber': residentNumber,
    'gender': gender,
    'weight': weight,
    'height': height,
    'photo': photo,
  };
}