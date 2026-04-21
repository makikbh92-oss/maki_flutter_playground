import 'package:flutter/material.dart';
import 'package:maki_flutter_playground/bootstrap/bootstrap.dart';

class MessageSheet {
  const MessageSheet();

  void show({
    required BuildContext context,
    bool isScrollControlled = false,
    bool isDismissible = true,
    Widget? child,
    List<Widget>? children
  }) async {
    await showModalBottomSheet<void>(
        useSafeArea: true,
        showDragHandle: true,
        isDismissible: isDismissible,
        isScrollControlled: isScrollControlled,
        context: context,
        clipBehavior: Clip.antiAlias,
        // ✅ 꼭 필요!
        backgroundColor: context.dsColor.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(
                  Theme.of(context).extension<DsSize>()!.radius
              )
          ),
        ),
        builder: (BuildContext context) =>
        switch(child){
          null =>
              UiBottomSheet(
                  children: children ?? []
              ),
          _ => child
        }
    );
  }

}