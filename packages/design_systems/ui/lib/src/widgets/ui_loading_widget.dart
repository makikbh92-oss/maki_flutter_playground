import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ui/src/atoms/buttons/ui_icon_button.dart';
import 'package:ui/src/common.dart';


class UiLoadingWidget extends StatelessWidget {
  final GestureTapCallback? onPressed;
  final bool useClose;


  const UiLoadingWidget({super.key,
    this.onPressed,
    this.useClose = true,


  });

  @override
  Widget build(BuildContext context) {
    final DsSize dsSize = Theme.of(context).extension<DsSize>()!;
    final DsColor dsColor = Theme.of(context).extension<DsColor>()!;

    return Positioned.fill(
        child: Container(
          color: Colors.black38,
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: .center,
                crossAxisAlignment: .center,
                children: [
                  SpinKitPulsingGrid(
                    color:  Colors.white,
                    size: dsSize.widgetLoading,
                  ),
                ],
              ),
              useClose == false
                  ? const SizedBox()
                  : Positioned(
                  top: dsSize.spacing56,
                  right: dsSize.gapHorizontal,
                  child: UiIconButton(onPressed: onPressed ?? (){}, iconColor: Colors.white,)
              )
            ],
          ),
        )
    );
  }
}
