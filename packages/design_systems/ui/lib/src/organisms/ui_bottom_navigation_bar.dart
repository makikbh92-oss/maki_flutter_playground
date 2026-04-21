import 'package:core/consts/consts.dart';
import 'package:ui/src/common.dart';


class UiBottomNavigationBar extends StatelessWidget {
  final void Function(int) callback;
  final int currentIndex;

  const UiBottomNavigationBar({super.key,
    required this.callback,
    required this.currentIndex,

  });

  @override
  Widget build(BuildContext context) {
    final DsSize dsSize = context.dsSize;
    final DsColor dsColor = context.dsColor;
    final bool isIos = context.dsFunc.isIos;
    return Container(
      color: dsColor.surface,
      child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                color: dsColor.surface,
                border: Border(
                    top: BorderSide(
                        color: dsColor.border,
                        width: dsSize.spacing1
                    )
                )
            ),
            child: SizedBox(
              width: dsSize.widthCommon,
              height: isIos
                  ? dsSize.navbar : dsSize.navbar+dsSize.spacing8,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: dsSize.gap
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _Nav(
                      onPressed: (){
                        callback(0);
                      },
                      isOn: currentIndex == 0,
                      svg: svgNavBarHome,
                      label: '홈',
                    ),

                    _Nav(
                        onPressed: (){callback(1);}, isOn: currentIndex == 1, svg: svgNavBarObservationRecord, label: '관찰진료'),

                    _Center(
                      onTap: (){
                        callback(2);
                      },
                      isOn: currentIndex == 2,
                    ),

                    _Nav(

                        onPressed: (){
                          callback(3);
                        },

                        isOn: currentIndex == 3, svg: svgNavBarTelehealthRecord, label: '진료기록'),

                    _Nav(
                      onPressed: (){
                        callback(4);
                      },
                      isOn: currentIndex == 4,
                      svg: svgNavBarUser,
                      label: '내 정보',
                    ),
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
}


class _Nav extends StatelessWidget {
  final GestureTapCallback onPressed;
  final bool isOn;
  final bool? isIos;
  final String svg;
  final String label;


  const _Nav({
    required this.onPressed,
    required this.isOn,
    this.isIos,
    required this.svg,
    required this.label,

  });

  @override
  Widget build(BuildContext context) {
    final DsColor dsColor = context.dsColor;
    final Color navColor = isOn ? dsColor.activated : dsColor.deactivated;
    final Column common = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        UiIcon.nav(
            svg: svg, color: navColor,
        ),
        const UiPad(type: PadType.height4),
        UiText.caption(
          text: label,
          // fontWeight: isOn ? FontWeight.w600 : FontWeight.w500,
          color: navColor,
          fontWeight: isOn ? FontWeight.w600 : FontWeight.w500,
        )
      ],
    );
    return Flexible(
        flex: 1,
        fit: FlexFit.tight,
        child: LayoutBuilder(
            builder: (context, constraints) =>
            switch(isIos){
              true =>
                  SizedBox(
                    height: constraints.maxHeight,
                    width: constraints.maxWidth,
                    child: common,
                  ),
              _ =>
                  UiButton(
                      onPressed: onPressed,
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                      child: common
                  ),
            }
        )
    );
  }
}

class _Center extends StatelessWidget {
  final GestureTapCallback onTap;
  final bool isOn;
  const _Center({
    required this.onTap,
    required this.isOn,
  });

  @override
  Widget build(BuildContext context) {
    final DsSize dsSize = Theme.of(context).extension<DsSize>()!;
    final DsColor dsColor = Theme.of(context).extension<DsColor>()!;
    return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: GestureDetector(
        onTap: onTap,
        child: Center(
            child: Stack(
              children: [
                Container(
                  width: dsSize.stethoscope-dsSize.spacing8,
                  height: dsSize.stethoscope-dsSize.spacing8,
                  decoration: BoxDecoration(
                      color: dsColor.primarySurface,
                      // isOn ? cssColor.primaryLight : cssColor.onPrimary,
                      shape: BoxShape.circle
                  ),
                ),
                Positioned(
                    top: 0,
                    left: 0,
                    bottom: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                            color: dsColor.primary,
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: isOn ? dsColor.primarySurface : dsColor.onPrimary,
                                width: dsSize.spacing2+(dsSize.spacing1)
                            )
                        ),
                        margin: EdgeInsets.all(dsSize.spacing2),
                        width: dsSize.stethoscope - dsSize.spacing2,
                        height: dsSize.stethoscope - dsSize.spacing2,
                        child: Center(
                          child:  UiIcon(
                            svg: svgNavBarStethoscope,
                            color: dsColor.onPrimary,
                          ),
                        ),
                      ),
                    )
                )
              ],
            )
        ),
      ),
    );
  }
}




class _Pad extends StatelessWidget {
  const _Pad();

  @override
  Widget build(BuildContext context) {
    final double pad = context.dsSize.spacing2;
    return SizedBox(
      width: pad,
    );
  }
}



