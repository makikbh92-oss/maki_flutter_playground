import 'package:maki_flutter_playground/bootstrap/bootstrap.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class MessageToast {

  const MessageToast();

  void show({
    required BuildContext context,
    required String text,
    bool isBottom = false,
    Color backgroundColor = Colors.black87,
    Color textColor = Colors.white,
    int timeInSecForIosWeb = 5,

  }) async{
    await Fluttertoast.cancel();
    if(context.mounted){
      await Fluttertoast.showToast(
        msg: text,
        timeInSecForIosWeb: timeInSecForIosWeb,
        gravity: isBottom ? ToastGravity.BOTTOM :ToastGravity.CENTER,
        backgroundColor: backgroundColor,
        textColor: textColor,
        fontAsset: 'assets/fonts/Pretendard-Medium.ttf',
        fontSize: context.dsSize.fontLabel,
      );
    }
  }

  // SnackBar _snackBar({
  //   required BuildContext context,
  //   required String text,
  // }){
  //
  //   final snackBar = SnackBar(
  //     clipBehavior: Clip.antiAlias,
  //     elevation: 5,
  //     padding: EdgeInsets.only(
  //       top:  Theme.of(context).extension<DsSize>()!.spacing16,
  //        left:  Theme.of(context).extension<DsSize>()!.spacing16,
  //       right:  Theme.of(context).extension<DsSize>()!.gap8,
  //       bottom: Theme.of(context).extension<DsSize>()!.spacing16,
  //     ),
  //     showCloseIcon: true,
  //     closeIconColor: Theme.of(context).extension<DsColor>()!.onPrimary,
  //     behavior: SnackBarBehavior.floating,
  //     duration: const Duration(milliseconds: 9000),
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(Theme.of(context).extension<DsSize>()!.radius),
  //     ),
  //     backgroundColor: Theme.of(context).extension<DsColor>()!.primary,
  //     content:  SizedBox(
  //       child: Text(
  //         text,
  //         style: Theme.of(context).extension<DsFont>()!.label.copyWith(
  //           color: Theme.of(context).extension<DsColor>()!.onPrimary,
  //           fontWeight: FontWeight.w500
  //         ),
  //       )
  //
  //     ),
  //     // action: SnackBarAction(
  //     //   label: label ?? '확인',
  //     //   textColor: seoulYellow,
  //     //   onPressed: (){
  //     //
  //     //   },
  //     // ),
  //   );
  //
  //   return snackBar;
  // }
  //
  //
  // void showSnackBar({required BuildContext context, required String text,
  // }){
  //   ScaffoldMessenger.of(context).hideCurrentSnackBar();
  //   ScaffoldMessenger.of(context).showSnackBar(
  //       _snackBar(text: text,  context: context,)
  //   );
  // }
  //
  // void removeSnack(BuildContext context){
  //   ScaffoldMessenger.of(context).removeCurrentSnackBar(
  //       reason: SnackBarClosedReason.remove
  //   );
  // }


}