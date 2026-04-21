class DadadocHospital {
  final String hospitalId;
  final String hospitalName;
  final String doctorName;
  final String thumbnail;
  final List<String> features;
  final List<DayHours> businessHours;
  final String breakTimeHtml;
  final String history;


 const DadadocHospital({
     this.hospitalId = '',
     this.hospitalName = '',
     this.doctorName = '',
     this.thumbnail = '',
     this.features = const [],
     this.businessHours = const [],
     this.breakTimeHtml = '',
     this.history = '',
  });

  factory DadadocHospital.fromJson(Map<String, dynamic> json) {
    return DadadocHospital(
      hospitalId: json['hospitalId'] as String? ?? '',
      hospitalName: json['hospitalName'] as String? ?? '',
      doctorName: json['doctorName'] as String? ?? '',
      thumbnail: json['thumbnail'] as String? ?? '',
      features: (json['features'] as List?)
          ?.map((e) => e as String? ?? '')
          .toList() ?? [],
      businessHours: (json['businessHours'] as List?)
          ?.map((e) => DayHours.fromJson(e as Map<String, dynamic>))
          .toList() ?? [],
      breakTimeHtml: json['breakTimeHtml'] as String? ?? '',
      history: json['history'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'hospitalId': hospitalId,
    'hospitalName': hospitalName,
    'thumbnail': thumbnail,
    'doctorName': doctorName,
    'features': features,
    'businessHours': businessHours.map((e) => e.toJson()).toList(),
    'breakTimeHtml': breakTimeHtml,
    'history': history,
  };

  factory DadadocHospital.dummy() {
    return DadadocHospital(
      hospitalId: 'hosp_100',
      hospitalName: '해님소아청소년과의원',
      doctorName: '김민준',
      thumbnail: 'assets/images/demo/hospital/10.jpg',
      features: ['전문의', '영상진료'],
      businessHours: [
        DayHours(day: 0, start: null, end: null),
        DayHours(day: 1, start: '08:00', end: '17:00'),
        DayHours(day: 2, start: '08:00', end: '17:00'),
        DayHours(day: 3, start: '08:00', end: '17:00'),
        DayHours(day: 4, start: '08:00', end: '17:00'),
        DayHours(day: 5, start: '08:00', end: '17:00'),
        DayHours(day: 6, start: null, end: null),
      ],
      history: '',
      breakTimeHtml:
      '''<div style="background: #fff8e1; border-left: 4px solid #ffc107; border-radius: 4px; padding: 8px 12px; margin: 0;"><p style="font-size: 14px; line-height: 1.4; color: #5a4a00; margin: 0;">🍱 점심시간은 오후 12시부터 오후 1시까지입니다. 수요일 토요일은 점심시간 없이 운영되오니 참고해주시기 바랍니다.</p></div>''',

    );
  }

}

class DayHours {
  final int day;
  final String? start;
  final String? end;

  DayHours({
    required this.day,
    this.start,
    this.end,
  });

  factory DayHours.fromJson(Map<String, dynamic> json) {
    return DayHours(
      day: json['day'] as int? ?? 0,
      start: json['start'] as String?,
      end: json['end'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'day': day,
    'start': start,
    'end': end,
  };




}