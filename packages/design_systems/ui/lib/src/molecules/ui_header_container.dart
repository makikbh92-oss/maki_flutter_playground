import 'package:ui/src/common.dart';


class UiHeaderContainer extends StatelessWidget {
  final List<String>? header;
  final List<String>? body;
  const UiHeaderContainer({super.key,
    this.header,
    this.body,
  });

  @override
  Widget build(BuildContext context) {
    return UiLayout(
      useWidth: true,
      child: Column(
          mainAxisAlignment: .start,
          crossAxisAlignment:  .start,
          children: [
            ...?header?.map((e) => UiText.header(text: e)),
            header != null && body != null ?const UiPad(type: PadType.height16) : const SizedBox(),
            ...?body?.map((e) => UiText.body(text: e)),
          ]
      ),


    );
  }
}
