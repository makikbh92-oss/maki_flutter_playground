import 'package:core/models/dadadoc_hospital.dart';

class DadadocHospitalDetail {
  final String hospitalId;
  final String hospitalName;
  final String doctorName;
  final String thumbnail;
  final List<String> features;
  final List<DayHours> businessHours;
  final String breakTimeHtml;
  final String noticeHtml;
  final String historyHtml;
  final String introduceHtml;

  const DadadocHospitalDetail({
    this.hospitalId = '',
    this.hospitalName = '',
    this.doctorName = '',
    this.thumbnail = '',
    this.features = const [],
    this.businessHours = const [],
    this.breakTimeHtml = '',
    this.noticeHtml = '',
    this.historyHtml = '',
    this.introduceHtml = '',
  });

  factory DadadocHospitalDetail.fromJson(Map<String, dynamic> json) {
    return DadadocHospitalDetail(
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
      noticeHtml: json['noticeHtml'] as String? ?? '',
      historyHtml: json['historyHtml'] as String? ?? '',
      introduceHtml: json['introduceHtml'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() =>
      {
        'hospitalId': hospitalId,
        'hospitalName': hospitalName,
        'thumbnail': thumbnail,
        'doctorName': doctorName,
        'features': features,
        'businessHours': businessHours.map((e) => e.toJson()).toList(),
        'breakTimeHtml': breakTimeHtml,
        'noticeHtml': noticeHtml,
        'historyHtml': historyHtml,
        'introduceHtml': introduceHtml,

      };

  factory DadadocHospitalDetail.dummy() {
    return DadadocHospitalDetail(
      hospitalId: 'hosp_100',
      hospitalName: '해님소아청소년과의원',
      doctorName: '김민준',
      thumbnail: 'assets/images/demo/hospital/1.jpg',
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
      breakTimeHtml:
      '''
    <div style="background: #fff8e1; border-left: 4px solid #ffc107; border-radius: 8px; padding: 16px; margin: 8px 0;">
      <p style="font-size: 14px; line-height: 1.7; color: #5a4a00; margin: 0;">
        🍱 점심시간은 오후 12시부터 오후 1시까지입니다.
      </p>
         <p>수요일 토요일은 점심시간 없이 운영되오니 참고해주시기 바랍니다.</p>
    </div>
  ''',
      noticeHtml:  '''
<div style="background: #ede7f6; border-left: 4px solid #673ab7; border-radius: 8px; padding: 16px; margin: 8px 0;">
  <p style="font-size: 15px; font-weight: bold; color: #311b92; margin-bottom: 8px;">
    🏥 비대면 진료 가능 질환 안내
  </p>
  <p style="font-size: 14px; line-height: 1.7; color: #311b92; margin: 0;">
    감기, 두통, 소화불량 등 가벼운 증상은 비대면으로 진료 가능합니다.
    단, 응급 증상이나 중증 질환은 반드시 내원하여 주시기 바랍니다.
  </p>
</div>''',
      historyHtml:     '''
<div style="font-family: -apple-system, sans-serif; padding: 16px; color: #1a1a2e;">
  <p style="font-size: 15px; font-weight: bold; margin-bottom: 12px;">👨‍⚕️ 원장 약력</p>
  <p style="font-size: 14px; line-height: 2.0; margin: 0;">
    • 서울대학교 의과대학 졸업<br/>
    • 서울대학교병원 인턴/레지던트 수료<br/>
    • 가정의학과 전문의 취득<br/>
    • 전) 강남세브란스병원 외래 교수<br/>
    • 현) 해님소아청소년과의원 원장
  </p>
</div>''',
      introduceHtml:
      '<div style="font-family: -apple-system, sans-serif; padding: 16px; color: #1a1a2e;">'
          '<p style="font-size: 15px; line-height: 1.7;">'
          '해님소아청소년과의원은 최신 의료 장비와 풍부한 임상 경험을 갖춘 전문 의료진이 함께하는 병원입니다. '
          '환자 중심의 따뜻한 진료 문화를 바탕으로 최선을 다하겠습니다.'
          '</p></div>',
    );
  }

}