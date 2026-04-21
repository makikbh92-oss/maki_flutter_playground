import 'package:ds/ds.dart';
import 'package:flutter/material.dart';
import 'package:maki_flutter_playground/features/hospital/select/hospital_select.dart';

class HospitalSelectListView extends StatefulWidget {
  const HospitalSelectListView({super.key});

  @override
  State<HospitalSelectListView> createState() => _HospitalSelectListViewState();
}

class _HospitalSelectListViewState extends State<HospitalSelectListView> {

  late final ScrollController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = ScrollController();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   _controller.addListener(() {
    //     if (_controller.position.pixels == _controller.position.maxScrollExtent && context.read<VmHospitalSelectListBloc>().state.hasMore == true) {
    //       context.read<VmHospitalSelectListBloc>().add(const EventHospitalSelectListLoad(isReset: false));
    //     }
    //   });
    // });

  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _Sort(controller: _controller),
        _Divider(),
        _List(controller: _controller)
      ],
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    final DsColor dsColor = context.dsColor;
    final DsSize dsSize = context.dsSize;
    return Container(
      width: dsSize.widthCommon,
      padding: EdgeInsets.symmetric(
        horizontal: dsSize.spacing24,
        vertical: dsSize.spacing16
      ),
      color: Colors.grey.shade100,
      child: UiText.label(text: '자녀의 다다닥 의료진을 선택해주세요.', color: dsColor.primary, fontWeight: FontWeight.w500,),
    );
  }
}



class _Sort extends StatelessWidget {
  final ScrollController controller;
  const _Sort({
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final DsSize dsSize = context.dsSize;
    return UiLayout(

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            UiButton(
                onPressed: () => context.bootstrap.message.sheet.show(context: context,
                  children: [
                    UiBottomSheetButton(
                        callback: (){
                          controller.animateTo(
                              0,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut
                          );
                          context.read<VmHospitalSelectListBloc>().add(EventHospitalSelectListLoad(isReset: true));
                        },
                        icon: Icons.check,
                        iconColor: context.dsColor.primary,
                        text: '기본순'
                    )
                  ]
                ),
                child: Container(
                  decoration: BoxDecoration(
                      color: context.dsColor.surface,
                      border: Border.all(color: context.dsColor.deactivated, width: dsSize.spacing1),
                      borderRadius: BorderRadius.circular(dsSize.radius)
                  ),
                  padding: EdgeInsets.only(
                      left: dsSize.spacing12,
                      right: dsSize.spacing8,
                      top: dsSize.spacing8,
                      bottom: dsSize.spacing8
                  ),
                  child: Row(
                    children: [
                      UiText.label(text: '기본순'),
                      UiPad(type: PadType.width4),
                      UiIcon(
                          icon: Icons.keyboard_arrow_down,
                          size: dsSize.iconForm
                      )
                    ],
                  ),
                )
            ),
            UiText.body(text: '${DateTime.now().year}년 ${DateTime.now().month}월 ${DateTime.now().day}일${switch(DateTime.now().weekday){
              1 => ' 월요일',
              2 => ' 화요일',
              3 => ' 수요일',
              4 => ' 목요일',
              5 => ' 금요일',
              6 => ' 토요일',
              7 => ' 일요일',
              _ => ''
            }
            }', color: context.dsColor.onSurfaceSecondary, fontWeight: FontWeight.w500,),
          ],
        )

    );
  }
}




class _List extends StatelessWidget {
  final ScrollController controller;
  const _List({
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocSelector<VmHospitalSelectListBloc, VmHospitalSelectListState, List<DadadocHospital>>(
          selector: (state) => state.hospitals,
          builder: (context, hospitals) =>
              Scrollbar(
                controller: controller,
                thumbVisibility: true,
                child: ListView.builder(
                  controller: controller,
                  itemCount: hospitals.length+1,
                  padding: context.dsSize.paddingScroll,
                  itemBuilder: (context, index) {
                    if(index == hospitals.length){
                      return _Loading();
                    }
                    else {
                      return _ListTile(
                        key: ValueKey(hospitals[index].hospitalId),
                        hospital: hospitals[index],
                      );
                    }
                  }
                ),
              )
      ),
    );
  }
}

class _ListTile extends StatelessWidget {
  final DadadocHospital hospital;
  const _ListTile({
    super.key,
    required this.hospital
  });

  @override
  Widget build(BuildContext context) {
    final DsSize dsSize = context.dsSize;
    final DsColor dsColor = context.dsColor;
    final DsFunc dsFunc = context.dsFunc;
    final ({bool? isOpen, String status, String time, String day, bool isToday}) convertHours = dsFunc.getBusinessHoursText(businessHours: hospital.businessHours);
    return UiButton(
        onPressed: () async{
          final DadadocHospital? result = await context.bootstrap.goRouter.path.hospitalDetailPagePushResult(
              context: context,
              hospital: hospital,
              isMy: false
          );
          if(result != null){
            if(context.mounted){
              context.bootstrap.goRouter.popResult(context: context, result: result);
            }
          }
        },
        child: Column(
          children: [
            UiLayout(
                padding: EdgeInsets.symmetric(
                    horizontal: dsSize.spacing24,
                    vertical: dsSize.spacing24,
                ),
                useWidth: true,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    UiImage.large(url: hospital.thumbnail),
                    UiPad(type: PadType.width32),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UiText.title(
                            text: hospital.hospitalName,
                            fontWeight: FontWeight.w700,
                          ),
                          UiHospitalFeaturesLabel(
                              isLarge: false,
                              features: hospital.features
                          ),
                          UiPad(type: PadType.height8),
                          Row(
                            children: [
                              UiText.label(
                                text: convertHours.status,
                                fontWeight: convertHours.isOpen == true ? FontWeight.w600 : FontWeight.w500,
                                color: convertHours.isOpen == true ? dsColor.primary : Colors.red,
                              ),
                              UiPad(type: PadType.width8),
                              UiText.label(
                                text: convertHours.isOpen == null ? '' : '${convertHours.time}',
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                )
            ),
            Container(
              width: dsSize.widthCommon,
              height: dsSize.border,
              color: dsColor.border,
            )
          ],
        )
    );
  }
}



class _Loading extends StatefulWidget {
  const _Loading();

  @override
  State<_Loading> createState() => _LoadingState();
}

class _LoadingState extends State<_Loading> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if(context.read<VmHospitalSelectListBloc>().state.hasMore == true){
        context.read<VmHospitalSelectListBloc>().add(const EventHospitalSelectListLoad(isReset: false));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final DsColor dsColor = context.dsColor;
    final DsSize dsSize = context.dsSize;
    return BlocSelector<VmHospitalSelectListBloc, VmHospitalSelectListState, bool>(
        selector: (state) => state.hasMore,
        builder: (context, hasMore) => hasMore
            ?
        Container(
          width: dsSize.widthCommon,
          height: dsSize.primaryButtonNav,
          color: dsColor.border,
          padding: EdgeInsets.all(dsSize.spacing16),
          child: Center(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                color: dsColor.primary,
              ),
            ),
          ),
        ) : SizedBox()
    );

  }
}
