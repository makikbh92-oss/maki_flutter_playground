import 'package:ui/src/common.dart';

enum TextType {display, header, title, subTitle, body, label, caption, buttonLarge, buttonMedium, buttonSmall}

class UiText extends StatelessWidget {
  final TextType type;
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;

  
  const UiText._({super.key,
    required this.text,
    required this.type,
    this.color,
    this.textAlign,
    this.overflow,
    this.fontWeight,

  });

  @override
  Widget build(BuildContext context) {
    final DsStyle style = context.dsStyle;
    return Text(
      text,
      style: switch(type){
        TextType.display => style.display,
        TextType.header => style.header,
        TextType.title => style.title,
        TextType.subTitle => style.subTitle,
        TextType.body => style.body,
        TextType.label => style.label,
        TextType.caption => style.caption,
        TextType.buttonLarge => style.buttonLarge,
        TextType.buttonMedium => style.buttonMedium,
        TextType.buttonSmall => style.buttonSmall,
      }.copyWith(
        color: color,
        overflow: overflow,
        fontWeight: fontWeight,
      ),
      textHeightBehavior: const TextHeightBehavior(
          applyHeightToFirstAscent: false,
          applyHeightToLastDescent: false
      ),
      textAlign: textAlign,
    );
  }



  factory UiText.display({
    Key? key,
    required String text,
    Color? color,
    TextAlign? textAlign,
    TextOverflow? overflow,
  }) => UiText._(
    key: key,
    text: text,
    type: TextType.display,
    color: color,
  );


  factory UiText.header({
    Key? key,
    required String text,
    Color? color,
    TextAlign? textAlign,
    TextOverflow? overflow,
    FontWeight? fontWeight,
  }) => UiText._(
    key: key,
    text: text,
    type: TextType.header,
    color: color,
    fontWeight: fontWeight,
  );

  factory UiText.title({
    Key? key,
    required String text,
    Color? color,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    TextOverflow? overflow,
  }) => UiText._(
    key: key,
    text: text,
    type: TextType.title,
    color: color,
    fontWeight: fontWeight,
    textAlign: textAlign,
    overflow: overflow,
  );

  factory UiText.subTitle({
    Key? key,
    required String text,
    TextAlign? textAlign,
    TextOverflow? overflow,
  }) => UiText._(
    key: key,
    text: text,
    type: TextType.subTitle,
    textAlign: textAlign,
    overflow: overflow,
  );

  factory UiText.body({
    Key? key,
    required String text,
    Color? color,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    TextOverflow? overflow,
  }) => UiText._(
    key: key,
    text: text,
    type: TextType.body,
    color: color,
    fontWeight: fontWeight,
    textAlign: textAlign,
    overflow: overflow,
  );

  factory UiText.label({
    Key? key,
    required String text,
    Color? color,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    TextOverflow? overflow,
  }) => UiText._(
    key: key,
    text: text,
    type: TextType.label,
    color: color,
    fontWeight: fontWeight,
    textAlign: textAlign,
    overflow: overflow,
  );

  factory UiText.caption({
    Key? key,
    required String text,
    Color? color,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    TextOverflow? overflow,
  }) => UiText._(
    key: key,
    text: text,
    type: TextType.caption,
    color: color,
    textAlign: textAlign,
    fontWeight: fontWeight,
    overflow: overflow,
  );

  factory UiText.buttonLarge({
    Key? key,
    required String text,
    TextAlign? textAlign,
    Color? color,
    TextOverflow? overflow,
  }) => UiText._(
    key: key,
    text: text,
    type: TextType.buttonLarge,
    textAlign: textAlign,
    color: color,
    overflow: overflow,
  );

  factory UiText.buttonMedium({
    Key? key,
    required String text,
    Color? color,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    TextOverflow? overflow,
  }) => UiText._(
    key: key,
    text: text,
    type: TextType.buttonMedium,
    color: color,
    textAlign: textAlign,
    fontWeight: fontWeight,
    overflow: overflow,
  );

  factory UiText.buttonSmall({
    Key? key,
    required String text,
    Color? color,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    TextOverflow? overflow,
  }) => UiText._(
    key: key,
    text: text,
    type: TextType.buttonSmall,
    color: color,
    textAlign: textAlign,
    fontWeight: fontWeight,
    overflow: overflow,
  );


  factory UiText.custom({
    Key? key,
    required String text,
    required TextType type,
    required Color color,
    required FontWeight fontWeight,
    TextAlign? textAlign,
    TextOverflow? overflow,
  }) => UiText._(
    key: key,
    text: text,
    type: type,
    color: color,
    fontWeight: fontWeight,
    textAlign: textAlign,
    overflow: overflow,
  );


}
