import 'package:flutter/cupertino.dart';
import 'package:maki_flutter_playground/bootstrap/bootstrap.dart';


class MessageController {
  final MessageToast toast = const MessageToast();
  final MessageDialog dialog = const MessageDialog();
  final MessageSheet sheet = const MessageSheet();


  const MessageController();

  void  demo(BuildContext context) =>  toast.show(context: context, text: '데모 버전에서는 지원하지 않는 기능입니다.');

}