import 'package:ui/src/common.dart';

import '../../ui.dart';

class UiHospitalDetailHtml extends StatelessWidget {
  final String label;
  final String html;

  const UiHospitalDetailHtml({super.key,
    required this.label,
    required this.html,
  });

  @override
  Widget build(BuildContext context) {

    return UiLayout(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UiText.title(
              text: label,
              fontWeight: FontWeight.w600,
          ),
          const UiPad(
              type: PadType.height16
          ),
          Html(
            data: html,
          ),
        ],
      ),
    );
  }
}


