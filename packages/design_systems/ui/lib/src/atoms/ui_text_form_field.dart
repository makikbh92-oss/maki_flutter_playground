import 'package:ui/src/common.dart';
import 'package:flutter/services.dart';



class UiTextFormField extends StatefulWidget {
  final void Function(String) callback;
  final String? initialData;
  final Color? fontColor;
  final bool useColor;
  final bool? obscureText;
  final bool? isDialog;

  final bool? useInputFormatters;
  final String? hintText;
  final String? errorText;
  final bool? enabled;
  final bool? autofocus;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;

  final ValueChanged<String>? onChanged;

  final VoidCallback? onEditingComplete;
  final TextInputType textInputType;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final String? labelText;
  final InputBorder? inputBorder;


  final String? textIcon;
  final double? hintSize;

  const UiTextFormField({super.key,
    required this.callback,
    this.initialData,
    this.fontColor,
    this.useColor = false,
    this.obscureText = false,
    this.isDialog,

    this.useInputFormatters,
    this.hintText,
    this.errorText,
    this.enabled,
    this.autofocus,
    this.maxLength,
    this.maxLines,
    this.minLines,

    this.onChanged,
    this.onEditingComplete,
    this.textInputType = TextInputType.text,
    this.focusNode,
    required this.textInputAction,
    this.labelText,
    this.inputBorder,


    this.textIcon,
    this.hintSize,
  });


  factory UiTextFormField.email({
    required void Function(String) callback,
    String? initialData,
    String? hint,
  }) => UiTextFormField(
      callback: callback,
      initialData: initialData,
      textInputAction: TextInputAction.done,
      hintText: hint ?? '',
      textInputType: TextInputType.emailAddress,
      useColor: true,
  );

  factory UiTextFormField.password({
    required void Function(String) callback,
    String? initialData,
    String? hint
  }) => UiTextFormField(
    callback: callback,
    initialData: initialData,
    textInputAction: TextInputAction.done,
    hintText: hint ?? '',
    textInputType: TextInputType.text,
    obscureText: true,
    useColor: true,
  );

  factory UiTextFormField.none() => UiTextFormField(
    callback: (val){},
    textInputAction: TextInputAction.done,
    hintText: '',
    textInputType: TextInputType.emailAddress,
    enabled: false,
    useColor: true,
  );



  factory UiTextFormField.name({
    required void Function(String) callback,
    String? initialData,
    String? hint
  }) => UiTextFormField(
    callback: callback,
    initialData: initialData,
    textInputAction: TextInputAction.done,
    hintText: hint ?? '',
    textInputType: TextInputType.name,
    useColor: true,
  );

  factory UiTextFormField.phone({
    required void Function(String) callback,
    String? initialData,
    String? hint
  }) => UiTextFormField(
    callback: callback,
    initialData: initialData,
    useInputFormatters: true,
    textInputAction: TextInputAction.done,
    hintText: hint ?? '',
    textInputType: TextInputType.number,
    useColor: true,
  );

  factory UiTextFormField.familyCode({
    required void Function(String) callback,
    String? initialData,
    String? hint
  }) => UiTextFormField(
    callback: callback,
    initialData: initialData,
    textInputAction: TextInputAction.done,
    hintText: hint ?? '',
    textInputType: TextInputType.text,
    useColor: true,
  );


  factory UiTextFormField.height({
    required void Function(String) callback,
    String? initialData,
  }) => UiTextFormField(
    callback: callback,
    initialData: initialData,
    textInputAction: TextInputAction.done,
    hintText: '100',
    textInputType: TextInputType.number,
    useColor: true,
    textIcon: 'cm',
    maxLength: 3,
  );

  factory UiTextFormField.weight({
    required void Function(String) callback,
    String? initialData,
  }) => UiTextFormField(
    callback: callback,
    initialData: initialData,
    textInputAction: TextInputAction.done,
    hintText: '10',
    textInputType: TextInputType.number,
    useColor: true,
    textIcon: 'kg',
    maxLength: 2,
  );

  factory UiTextFormField.temp({
    required void Function(String) callback,
    required String initialData,
  }) => UiTextFormField(
    callback: callback,
    initialData: initialData,
    textInputAction: TextInputAction.done,
    textInputType: const TextInputType.numberWithOptions(decimal: true),
    useColor: true,
    textIcon: '℃',

  );


  @override
  State<UiTextFormField> createState() => _UiTextFormFieldState();
}


class _UiTextFormFieldState extends State<UiTextFormField> {


  bool _isClear = false;
  bool _obscureText = true;

  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });

    _controller = TextEditingController();
    _controller.addListener(() {
      widget.callback(_controller.text);
      if(_controller.text.isNotEmpty){
        if(!_isClear){
          setState(() {
            _isClear = true;
          });
        }
      }
      if(_controller.text.isEmpty){
        if(_isClear){
          setState(() {
            _isClear = false;
          });
        }
      }
    });
    if(widget.initialData != null){
      _controller.text = widget.initialData!;
    }
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //
    //   if(widget.cachingData != null){
    //
    //
    //
    //   }
    // });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

@override
  Widget build(BuildContext context) {
    final DsSize dsSize = context.dsSize;
    final DsColor dsColor = context.dsColor;
    final DsStyle dsStyle = context.dsStyle;


    final OutlineInputBorder  noneBorder = dsStyle.textFormFieldBorder;
    final TextStyle textStyle = dsStyle.body.copyWith(height: 0);
    final EdgeInsetsGeometry contentPadding = dsStyle.contentPadding;

    return SizedBox(
      width: dsSize.widthCommon,
      child: TextFormField(
        // enableInteractiveSelection: false,
        onTapOutside: (_){
          Theme.of(context).extension<DsFunc>()!.hideFocus(context);
        },
        maxLength: widget.maxLength,
        inputFormatters: widget.useInputFormatters == true ? Theme.of(context).extension<DsFunc>()!.phoneNumberFormatter : null,
        // onTap: (){
        //   widget.callback(_controller.text);
        // },
        expands: false,
        onEditingComplete: widget.onEditingComplete,
        maxLines: widget.maxLines ?? 1,
        minLines: widget.minLines,
        style: textStyle,
        focusNode: _focusNode,
        controller: _controller,
        cursorColor: dsColor.activated,
        textInputAction: widget.textInputAction ??  TextInputAction.done,
        //비밀번호 입력할때,
        obscureText: widget.obscureText == true ? _obscureText : false,
        autofocus: widget.autofocus ?? false,
        // onChanged: Theme.of(context).extension<DsFunc>()!.debounceOnField(onChanged:(val){
        //   widget.callback(val);
        //   setState(() {
        //     _isClear = true;
        //   });
        // }),
        keyboardType: widget.textInputType,
        // onFieldSubmitted: (val){
        //   widget.callback(val);
        // },
        decoration: InputDecoration(
            counterText: '',
            labelText: widget.labelText,
            suffixIcon: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                _isClear && _isFocused
                    ? UiIconButton(
                  onPressed: (){
                    _controller.clear();
                    // widget.callback('');
                  },
                  iconColor: dsColor.primary,
                  icon: Icons.cancel_outlined,
                )
                    : SizedBox(
                  width: dsSize.iconFormButtonArea,
                ),
                widget.textIcon == null
                    ? const SizedBox()
                    : SizedBox(
                  width: dsSize.iconFormText,
                  height: dsSize.iconFormText,
                  child: UiText.caption(
                    text: widget.textIcon!,
                  ).scaleDown(),
                ),
                switch(widget.obscureText){
                  true =>
                      UiIconButton(
                        onPressed: (){
                          _obscureText =! _obscureText;
                          setState(() {});
                        },
                        icon: _obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                        iconColor: dsColor.primary,
                      ),
                  _ => const SizedBox()
                },

                SizedBox(
                  width: dsSize.spacing4,
                )
              ],
            ),
            contentPadding: contentPadding,
            hintText: widget.hintText,
            errorText: widget.errorText,
            labelStyle: const TextStyle(),
            hintStyle: textStyle.copyWith(
                color: dsColor.hint,
            ),
            fillColor: widget.useColor ? dsColor.form : dsColor.surface,
            filled: true,
            enabled: widget.enabled ?? true,
            disabledBorder: noneBorder,
            //모든 Input 상태의 기본 스타일 세팅
            enabledBorder: noneBorder,
            border: noneBorder,
            focusedBorder: noneBorder.copyWith(
              borderSide: BorderSide(
                color: dsColor.activated
              )
            )
        ),
      ),
    );
  }

}
