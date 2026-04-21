import 'package:flutter/material.dart';
import 'package:maki_flutter_playground/features/home/home.dart';

class HomeProfileCardView extends StatelessWidget {
  final GestureTapCallback onPressedList;
  final GestureTapCallback onPressedInfo;
  final ProfileEntity entity;
  const HomeProfileCardView({super.key,
    required this.onPressedList,
    required this.onPressedInfo,
    required this.entity,
  });

  @override
  Widget build(BuildContext context) {
    final DsSize dsSize = context.dsSize;
    final DsColor dsColor = context.dsColor;

    return UiLayout(
      child: UiCard(
          imageUrl: imageCardBlue,
          padding: EdgeInsets.all(
              dsSize.spacing24
          ),
          child: SizedBox(
            width: dsSize.widthCommon,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: UiText.header(
                        text: entity.name,
                        color: dsColor.onPrimary,
                      ),
                    ),
                    SizedBox(
                      width: dsSize.spacing16,
                    ),
                    UiText.body(
                        text: entity.gender,
                        fontWeight: FontWeight.w700,
                        color: dsColor.onPrimary
                    ),
                    SizedBox(
                      width: dsSize.spacing8,
                    ),
                    UiText.label(
                        text: entity.age,
                        fontWeight: FontWeight.w700,
                        color: dsColor.onPrimary
                    ),
                  ],
                ),
                SizedBox(
                  height: dsSize.spacing16,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    UiImage.large(url: entity.photo),
                    // Container(
                    //     decoration: BoxDecoration(
                    //       color: cssColor.onPrimary,
                    //       borderRadius: BorderRadius.circular(cssSize.grid8px)
                    //     ),
                    //     padding: EdgeInsets.all(cssSize.grid1px),
                    //     child: DsNetworkThumbnailImage.large(url: thumbNailUrl)
                    // ),
                    SizedBox(
                      width: dsSize.spacing24,
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: entity.hospitalId.isEmpty
                        ? [
                          _Info(
                              iconData: Icons.local_hospital_outlined,
                              label: '다다닥 의료진',
                              text: '선택된 의료진이 없습니다.'
                          ),

                        ] : [
                          _Info(
                              iconData: Icons.local_hospital_outlined,
                              label: '다다닥 의료진',
                              text: entity.myHospital!.hospitalName
                          ),
                          SizedBox(
                            height: dsSize.spacing16,
                          ),
                          _Info(
                              iconData: Icons.history,
                              label: '최근 진료 이력',
                              text: entity.myHospital!.history.isEmpty ? '최근 진료 이력이 없습니다.' : entity.myHospital!.history
                          ),
                        ]

                      )
                    ),
                  ],
                ),
                UiPad(type: PadType.height24),
                entity.hospitalId.isEmpty
                    ?  _Button(
                    onPressed: onPressedList,
                    icon: Icons.local_hospital,
                    text: '다다닥 의료진 등록'
                )
                    :
                Row(
                  children: [
                    Expanded(
                      child: _Button(
                          onPressed: onPressedInfo,
                          icon: Icons.search_rounded,
                          text: '의료진 상세'
                      ),
                    ),
                    UiPad(type: PadType.width16),
                    Expanded(
                      child: _Button(
                          onPressed: onPressedList,
                          icon: Icons.people,
                          text: '의료진 변경'
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
      ),
    );
  }
}


class _Info extends StatelessWidget {
  final IconData iconData;
  final String label;
  final String text;
  const _Info({
    required this.iconData,
    required this.label,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final DsSize dsSize = context.dsSize;
    final DsColor dsColor = context.dsColor;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            UiIcon(
              icon: iconData,
              color: Colors.white60,
              size: dsSize.fontBody,
              // sizeType: SizeType.medium,
            ),
            SizedBox(
              width: dsSize.spacing4,
            ),
            Center(
              child: UiText.label(
                fontWeight: FontWeight.w700,
                text: label,
                color: Colors.white60,
              ),
            ),

          ],
        ),
        SizedBox(
          height: dsSize.spacing4,
        ),
        UiText.label(
          text: text,
          fontWeight: FontWeight.w700,
          color: dsColor.onPrimary,
        ),
      ],
    );
  }
}


class _Button extends StatelessWidget {
  final GestureTapCallback onPressed;
  final IconData icon;
  final String text;
  const _Button({
    required this.onPressed,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final DsColor dsColor = context.dsColor;
    final DsSize dsSize = context.dsSize;
    return UiButton(
        onPressed: onPressed,
        child: Container(
          decoration: BoxDecoration(
              color: dsColor.cancel,
              borderRadius: BorderRadius.circular(dsSize.radius)
          ),
          height: dsSize.primaryButtonNormal,
          width: dsSize.widthCommon,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UiIcon(
                icon: icon,
                color: dsColor.primary,
                size: dsSize.fontButtonLarge,
              ),
              SizedBox(
                width: dsSize.spacing8,
              ),
              UiText.buttonMedium(
                text: text,
                color: dsColor.primary,
                fontWeight: FontWeight.w600,

              ),

            ],
          ),
        )
    );
  }
}
