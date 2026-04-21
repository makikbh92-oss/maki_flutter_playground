
import 'dart:math';
import 'package:core/core.dart';

List<DadadocHospital> generateDummyHospitals() {
  final random = Random(42); // 시드 고정 → 항상 동일한 데이터

  final cities = ["서울","부산","대구","인천","광주","대전","울산","세종","수원","성남","용인","고양","창원","청주","전주","천안","안산","남양주","화성","평택", "해님", "사랑", "우리 아이"];
  final suffixes = ["소아청소년과의원", "소아청소년과", "병원"];
  final lastNames = ["김","이","박","최","정","강","조","윤","장","임"];
  final firstNames = ["민준","서준","도윤","예준","시우","주원","하준","지호","준서","준우","지훈","도현","건우","현우","우진","민재","지원","선우","서진","태양"];

  final schedules = [
    ("09:00", "18:00"),
    ("08:30", "17:30"),
    ("09:00", "17:00"),
    ("08:00", "20:00"),
    ("10:00", "19:00"),
    ("09:00", "19:00"),
    ("08:00", "18:00"),
  ];
  final satSchedules = [
    ("09:00", "13:00"),
    ("09:00", "14:00"),
    ("10:00", "15:00"),
  ];

  return [
    DadadocHospital.dummy(), // 첫 번째는 고정
    ...List.generate(89, (i) { // 89개 생성 (총 90개)
      final sch = schedules[i % schedules.length];
      final satSch = satSchedules[i % satSchedules.length];

      final features = <String>[
        if (random.nextBool()) "전문의",
        if (random.nextBool()) "영상진료",
        if (random.nextBool()) "서류발급",
      ];

      return DadadocHospital(
        hospitalId: "hosp_${(i + 2).toString().padLeft(3, '0')}", // 002부터 시작
        hospitalName: "${cities[i % cities.length]} ${suffixes[i % suffixes.length]}",
        doctorName: "${lastNames[i % lastNames.length]}${firstNames[i % firstNames.length]}",
        thumbnail: "assets/images/demo/hospital/${random.nextInt(10) + 1}.jpg",
        features: features,
        breakTimeHtml: randomBreakTimeHtml(),
        businessHours: [
          DayHours(day: 0, start: sch.$1, end: sch.$2),
          DayHours(day: 1, start: i % 3 == 0 ? null : sch.$1, end: i % 3 == 0 ? null : sch.$2),
          DayHours(day: 2, start: sch.$1, end: sch.$2),
          DayHours(day: 3, start: sch.$1, end: sch.$2),
          DayHours(day: 4, start: sch.$1, end: sch.$2),
          DayHours(day: 5, start: sch.$1, end: sch.$2),
          DayHours(day: 6, start: satSch.$1, end: satSch.$2),
        ],
      );
    }),
  ];
}

final _random = Random();

String randomBreakTimeHtml() {
  final list = [
    '''
<div style="background: #fff8e1; border-left: 4px solid #ffc107; border-radius: 4px; padding: 8px 12px; margin: 0;">
  <p style="font-size: 14px; line-height: 1.7; color: #5a4a00; margin: 0;">
    🍱 점심시간은 오후 12시부터 오후 1시까지입니다.
  </p>
  <p style="margin: 0;">수요일 토요일은 점심시간 없이 운영되오니 참고해주시기 바랍니다.</p>
</div>''',
    '''
<div style="background: #fce4ec; border-left: 4px solid #e91e63; border-radius: 4px; padding: 8px 12px; margin: 0;">
  <p style="font-size: 14px; line-height: 1.7; color: #880e4f; margin: 0;">
    🕐 점심시간은 오후 1시부터 2시까지 운영이 중단됩니다.
  </p>
</div>''',
    '''
<div style="background: #e3f2fd; border-left: 4px solid #2196f3; border-radius: 4px; padding: 8px 12px; margin: 0;">
  <p style="font-size: 14px; line-height: 1.7; color: #0d47a1; margin: 0;">
    ☕ 휴게시간: 평일 낮 12:30 ~ 13:30
  </p>
</div>''',
  ];
  return list[_random.nextInt(list.length)];
}

String randomNoticeHtml() {
  final list = [
    '''
<div style="background: #e8f0fe; border-left: 4px solid #4285f4; border-radius: 4px; padding: 8px 12px; margin: 0;">
  <p style="font-size: 15px; font-weight: bold; color: #1a3a6b; margin: 0 0 4px 0;">
    📱 비대면 진료 안내
  </p>
  <p style="font-size: 14px; line-height: 1.7; color: #1a3a6b; margin: 0;">
    본 병원은 비대면 진료를 운영하고 있습니다. 앱을 통해 간편하게 예약 후
    영상통화로 진료를 받으실 수 있으며, 처방전은 가까운 약국으로 전송됩니다.
  </p>
</div>''',
    '''
<div style="background: #e3f2fd; border-left: 4px solid #2196f3; border-radius: 4px; padding: 8px 12px; margin: 0;">
  <p style="font-size: 15px; font-weight: bold; color: #0d47a1; margin: 0 0 4px 0;">
    💊 비대면 진료 이용 방법
  </p>
  <p style="font-size: 14px; line-height: 1.7; color: #0d47a1; margin: 0;">
    1. 앱에서 비대면 진료 예약<br/>
    2. 예약 시간에 영상통화 진료<br/>
    3. 처방전 근처 약국 수령<br/>
    초진 환자도 비대면 진료 가능합니다.
  </p>
</div>''',
    '''
<div style="background: #ede7f6; border-left: 4px solid #673ab7; border-radius: 4px; padding: 8px 12px; margin: 0;">
  <p style="font-size: 15px; font-weight: bold; color: #311b92; margin: 0 0 4px 0;">
    🏥 비대면 진료 가능 질환 안내
  </p>
  <p style="font-size: 14px; line-height: 1.7; color: #311b92; margin: 0;">
    감기, 두통, 소화불량 등 가벼운 증상은 비대면으로 진료 가능합니다.
    단, 응급 증상이나 중증 질환은 반드시 내원하여 주시기 바랍니다.
  </p>
</div>''',
    '''
<div style="background: #e8f5e9; border-left: 4px solid #43a047; border-radius: 4px; padding: 8px 12px; margin: 0;">
  <p style="font-size: 15px; font-weight: bold; color: #1b5e20; margin: 0 0 4px 0;">
    🕐 비대면 진료 운영 시간
  </p>
  <p style="font-size: 14px; line-height: 1.7; color: #1b5e20; margin: 0;">
    평일 오전 9시 ~ 오후 6시, 토요일 오전 9시 ~ 오후 1시 운영됩니다.
    공휴일 및 일요일은 비대면 진료가 제공되지 않습니다.
  </p>
</div>''',
    '''
<div style="background: #fff8e1; border-left: 4px solid #ffc107; border-radius: 4px; padding: 8px 12px; margin: 0;">
  <p style="font-size: 15px; font-weight: bold; color: #5a4a00; margin: 0 0 4px 0;">
    💳 비대면 진료 비용 안내
  </p>
  <p style="font-size: 14px; line-height: 1.7; color: #5a4a00; margin: 0;">
    비대면 진료는 건강보험이 적용되며, 일반 내원 진료와 동일한 본인부담금이 적용됩니다.
    처방전 발급 시 약국 조제비는 별도로 부과됩니다.
  </p>
</div>''',
  ];
  return list[_random.nextInt(list.length)];
}

String randomIntroduceHtml(String hospitalName) {
  final list = [
    '<div style="font-family: -apple-system, sans-serif; padding: 0; color: #1a1a2e;">'
        '<p style="font-size: 15px; line-height: 1.7; margin: 0;">'
        '$hospitalName은 최신 의료 장비와 풍부한 임상 경험을 갖춘 전문 의료진이 함께하는 병원입니다. '
        '환자 중심의 따뜻한 진료 문화를 바탕으로 최선을 다하겠습니다.'
        '</p></div>',
    '<div style="font-family: -apple-system, sans-serif; padding: 0; color: #1a1a2e;">'
        '<p style="font-size: 15px; line-height: 1.7; margin: 0;">'
        '$hospitalName은 지역 주민의 건강을 책임지는 믿음직한 의료기관입니다. '
        '항상 친절하고 정확한 진료로 보답하겠습니다.'
        '</p></div>',
    '<div style="font-family: -apple-system, sans-serif; padding: 0; color: #1a1a2e;">'
        '<p style="font-size: 15px; line-height: 1.7; margin: 0;">'
        '오랜 경험과 노하우를 바탕으로 $hospitalName은 최고의 의료 서비스를 제공합니다. '
        '내원하시는 모든 분께 만족스러운 진료 경험을 드리겠습니다.'
        '</p></div>',
  ];
  return list[_random.nextInt(list.length)];
}

String randomHistoryHtml(String hospitalName) {
  final list = [
    '''
<div style="font-family: -apple-system, sans-serif; padding: 0; color: #1a1a2e;">
  <p style="font-size: 15px; font-weight: bold; margin: 0 0 8px 0;">👨‍⚕️ 원장 약력</p>
  <p style="font-size: 14px; line-height: 2.0; margin: 0;">
    • 서울대학교 의과대학 졸업<br/>
    • 서울대학교병원 인턴/레지던트 수료<br/>
    • 가정의학과 전문의 취득<br/>
    • 전) 강남세브란스병원 외래 교수<br/>
    • 현) $hospitalName 원장
  </p>
</div>''',
    '''
<div style="font-family: -apple-system, sans-serif; padding: 0; color: #1a1a2e;">
  <p style="font-size: 15px; font-weight: bold; margin: 0 0 8px 0;">👨‍⚕️ 원장 약력</p>
  <p style="font-size: 14px; line-height: 2.0; margin: 0;">
    • 연세대학교 의과대학 졸업<br/>
    • 세브란스병원 인턴/레지던트 수료<br/>
    • 내과 전문의 취득<br/>
    • 전) 삼성서울병원 임상강사<br/>
    • 대한내과학회 정회원
  </p>
</div>''',
    '''
<div style="font-family: -apple-system, sans-serif; padding: 0; color: #1a1a2e;">
  <p style="font-size: 15px; font-weight: bold; margin: 0 0 8px 0;">👨‍⚕️ 원장 약력</p>
  <p style="font-size: 14px; line-height: 2.0; margin: 0;">
    • 고려대학교 의과대학 졸업<br/>
    • 고려대학교 안암병원 인턴/레지던트 수료<br/>
    • 소아청소년과 전문의 취득<br/>
    • 전) 아산병원 소아과 전임의<br/>
    • 대한소아과학회 정회원
  </p>
</div>''',
  ];
  return list[_random.nextInt(list.length)];
}

// {
// "hospitalId": "hosp_001",
// "hospitalName": "서울 강남 병원",
// "doctorName": "김민준",
// "features": [
// "주차가능",
// "야간진료"
// ],
// "businessHours": [
// {
// "day": 0,
// "closed": true,
// "start": null,
// "end": null
// },
// {
// "day": 1,
// "closed": false,
// "start": "08:00",
// "end": "17:00"
// },
// {
// "day": 2,
// "closed": false,
// "start": "08:00",
// "end": "17:00"
// },
// {
// "day": 3,
// "closed": false,
// "start": "08:00",
// "end": "17:00"
// },
// {
// "day": 4,
// "closed": false,
// "start": "08:00",
// "end": "17:00"
// },
// {
// "day": 5,
// "closed": false,
// "start": "08:00",
// "end": "17:00"
// },
// {
// "day": 6,
// "closed": false,
// "start": "08:00",
// "end": "12:00"
// }
// ]
// }