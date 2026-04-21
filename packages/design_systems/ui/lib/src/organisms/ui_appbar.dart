
import 'package:ui/src/atoms/buttons/ui_icon_button.dart';
import 'package:ui/src/atoms/buttons/ui_logo_button.dart';
import 'package:ui/src/common.dart';

class UiAppbar extends StatelessWidget {
  final Widget? leading;
  final Widget? title;
  final List<Widget>? actions;
  final bool onlyTitle;
  final PaddingReduceType paddingReduceType;

  const UiAppbar._({super.key,
    this.leading,
    this.title,
    this.actions,
    this.onlyTitle = false,
    this.paddingReduceType = PaddingReduceType.both
  });

  @override
  Widget build(BuildContext context) {
    final DsSize dsSize = context.dsSize;
    return Container(
      color: Colors.transparent,
      width: dsSize.widthCommon,
      margin: dsSize.paddingWithButton(paddingReduceType),
      child: onlyTitle
          ? Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const _NullBox(),
                title ?? const SizedBox(),
                const _NullBox(),
              ],
             )
          : Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          leading ?? const _NullBox(),
          title ?? const SizedBox(),
          switch(actions){
            null => const _NullBox(),
            _ =>
                Row(
                  children: [
                    ...actions!.map((action) => action)
                  ],
                )
          }
        ],
      ),
    );
  }

  factory UiAppbar.leadingTitle({
    Key? key,
    required GestureTapCallback onPressed,
    required String text,
  }) => UiAppbar._(
    leading: UiIconButton(
      onPressed: onPressed,
      svg: svgBack,
    ),
    title: _Title(text: text),
  );

  factory UiAppbar.leading({
    Key? key,
    required GestureTapCallback onPressed,
  }) => UiAppbar._(
    leading: UiIconButton(
      onPressed: onPressed,
      svg: svgBack,
    ),
  );

  factory UiAppbar.logo({
    Key? key,
    required GestureTapCallback onPressed,
    required GestureTapCallback onPressedActions
  }) => UiAppbar._(
    paddingReduceType: PaddingReduceType.right,
    leading: UiLogoButton(onPressed: onPressed),
    actions: [
      _Button(onPressed: onPressedActions)
    ],
  );

  // factory UiAppbar.leading({
  //   Key? key,
  //   required GestureTapCallback onPressed,
  //   bool enabled = true,
  // }) => UiAppbar._(
  //   key: key,
  //   leading: UiIconButton.back(
  //     onPressed: onPressed,
  //     enabled: enabled,
  //   ),
  // );

  // factory UiAppbar.home({
  //   Key? key,
  //   required GestureTapCallback onPressed,
  //   bool enabled = true,
  // }) => UiAppbar._(
  //   key: key,
  //   leading: UiSvgButton(
  //       onPressed: (){},
  //       originSize: const Size(152, 24), svg: svgLogo
  //   ),
  //   actions: [
  //     UiSvgButton(
  //       onPressed: onPressed,
  //       originSize: const Size(118, 40), svg: svgMy, useColor: true,
  //     ),
  //
  //   ],
  // );
  //
  // factory UiAppbar.homeProfile({
  //   Key? key,
  //   required GestureTapCallback onPressed,
  //   required String text,
  //   required String url,
  // }) => UiAppbar._(
  //   key: key,
  //   leading: UiText.header(text: text),
  //   actions: [
  //     UiProfileButton.small(onPressed: onPressed, url: url,)
  //   ],
  //   usePadding24: true,
  // );
  //
  // factory UiAppbar.title({
  //   Key? key,
  //   required String text,
  //
  // }) => UiAppbar._(
  //     key: key,
  //     title: _Title(
  //       text: text,
  //     ),
  //   onlyTitle: true,
  // );
  //

  //
  //
  // factory UiAppbar.leadingTitle({
  //   Key? key,
  //   required GestureTapCallback onPressed,
  //   required String text,
  //   bool enabled = true,
  //
  // }) =>  UiAppbar._(
  //   leading: UiIconButton.back(
  //     onPressed: onPressed,
  //     enabled: enabled,
  //   ),
  //   title: _Title(
  //     text: text,
  //   ),
  // );
  //
  // factory UiAppbar.leadingTitleActions({
  //   Key? key,
  //   required GestureTapCallback onPressed,
  //   required String text,
  //   required List<Widget> actions
  // }) =>  UiAppbar._(
  //
  //   leading: UiIconButton.back(
  //     onPressed: onPressed,
  //   ),
  //   title: _Title(
  //     text: text,
  //   ),
  //   actions: actions,
  // );



}

class _Title extends StatelessWidget {
  final String text;
  final Alignment? alignment;

  const _Title({
    required this.text,
    this.alignment,

  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: context.dsSize.gapAppbarTitle
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: alignment ?? Alignment.center,
          child: UiText.title(text: text, fontWeight: FontWeight.w600,),
        ),
      ),
    );
  }
}


class _Button extends StatelessWidget {
  final GestureTapCallback onPressed;
  const _Button({
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return  UiButton(
        onPressed: onPressed,
        padding: EdgeInsets.all(context.dsSize.gap),
        child: UiText.buttonSmall(text: '프로필 예제 이동', color: context.dsColor.primary,)
    );
  }
}


class _NullBox extends StatelessWidget {
  const _NullBox();

  @override
  Widget build(BuildContext context) {
    return UiIconButton(
        onPressed: (){},
        enabled: false,
    );
  }
}
