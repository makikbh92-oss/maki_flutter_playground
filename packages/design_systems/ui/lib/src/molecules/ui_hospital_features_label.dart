import 'package:ui/src/common.dart';


class UiHospitalFeaturesLabel extends StatelessWidget {
  final bool isLarge;
  final List<String> features;
  const UiHospitalFeaturesLabel({
    super.key,
    required this.isLarge,
    required this.features
  });

  @override
  Widget build(BuildContext context) {
    final DsSize dsSize = context.dsSize;
    final DsColor dsColor = context.dsColor;
    return SizedBox(
      height: dsSize.iconButtonArea,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: features.map((e) =>
              Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: dsSize.spacing8,
                      vertical: dsSize.spacing4
                  ),
                  margin: EdgeInsets.only(
                      right: dsSize.spacing8
                  ),
                  decoration: BoxDecoration(
                      color: dsColor.cancel,
                      borderRadius: BorderRadius.circular(dsSize.radius)
                  ),
                  child: isLarge
                          ? UiText.label(text: e, color: dsColor.onCancel, fontWeight: FontWeight.w500)
                          : UiText.caption(text: e, color: dsColor.onCancel, fontWeight: FontWeight.w500)

              )
          ).toList()
      ),
    );
  }
}
