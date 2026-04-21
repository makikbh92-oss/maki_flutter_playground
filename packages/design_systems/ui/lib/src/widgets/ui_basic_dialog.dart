import 'package:ui/src/common.dart';

class UiBasicDialog extends StatelessWidget {
  final bool useDebounce;

  final String title;
  final String? body;
  final String confirmText;
  final String cancelText;
  final GestureTapCallback conFirmOnTap;
  final GestureTapCallback? cancelOnTap;


  const UiBasicDialog({
    super.key,
    required this.useDebounce,
    required this.title,
    required this.body,
    required this.confirmText,
    required this.conFirmOnTap,
    this.cancelText = '',
    this.cancelOnTap,
  });

  @override
  Widget build(BuildContext context) {
    final DsSize dsSize = Theme.of(context).extension<DsSize>()!;
    final DsColor dsColor = Theme.of(context).extension<DsColor>()!;
    return Dialog(
      backgroundColor: dsColor.onPrimary,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(dsSize.radius)
      ),
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: dsSize.widthCommon,
              color: Colors.transparent,
              padding: EdgeInsets.only(
                  top: dsSize.spacing32,
                  left: dsSize.spacing24,
                  right: dsSize.spacing24,
                  bottom: dsSize.spacing24
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  body == null
                      ? UiText.body(text: title)
                      :
                  UiText.title(
                      text: title,
                  ),
                  body == null
                      ? const SizedBox()
                      : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const UiPad(type: PadType.height16),

                      UiText.label(
                        text: body!,
                      ),
                    ],
                  ),
                  const UiPad(type: PadType.height32),
                  _Button(
                    useDebounce: useDebounce,
                    trueText: confirmText,
                    trueCallback: conFirmOnTap,
                    falseText: cancelText,
                    falseCallback: cancelOnTap,
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  final bool useDebounce;
  final String trueText;
  final void Function()? trueCallback;
  final String falseText;
  final void Function()? falseCallback;
  const _Button({
    required this.useDebounce,
    required this.trueText,
    required this.trueCallback,
    required this.falseText,
    required this.falseCallback,
  });

  @override
  Widget build(BuildContext context) {
    final DsSize dsSize = Theme.of(context).extension<DsSize>()!;
    final DsColor dsColor = Theme.of(context).extension<DsColor>()!;
    return SizedBox(
      width: dsSize.widthCommon,
      height: dsSize.primaryButtonDialog,
      child: switch(falseCallback){
        null =>
            _Detail(
              isConfirm: true,
              isDebounce: false,
              buttonText: trueText,
              background: dsColor.primary,
              callback: trueCallback,
            ),
        _ => Row(
          children: [
            Expanded(
              flex: 11,
              child: _Detail(
                isDebounce: false,
                buttonText: falseText,
                background: dsColor.cancel,
                isConfirm: false,
                callback: falseCallback,
              ),
            ),
            const UiPad(type: PadType.width16,),
            Expanded(
              flex: 12,
              child: _Detail(
                isDebounce: useDebounce,
                buttonText: trueText ?? '확인',
                isConfirm: true,
                background:dsColor.primary,
                callback: trueCallback,
              ),
            ),
          ],
        )
      },
    );
  }
}


class _Detail extends StatelessWidget {
  final bool isDebounce;
  final String buttonText;
  final Color background;

  final bool isConfirm;
  final void Function()? callback;
  const _Detail({
    required this.isDebounce,
    required this.buttonText,
    required this.background,
    required this.isConfirm,
    this.callback,
  });

  @override
  Widget build(BuildContext context) {
    final DsColor dsColor = context.dsColor;
    return UiButton(
        useDebounce: isDebounce,
        color:  background,
        onPressed: (){
          context.dsFunc.closeDialog(context);
          callback?.call();
        },
        child: Center(
            child: UiText.label(
              text: buttonText,
             color: isConfirm ? dsColor.onPrimary : dsColor.onCancel,
            ))
    );
  }
}