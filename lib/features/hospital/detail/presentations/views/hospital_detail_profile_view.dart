import 'package:ds/ds.dart';
import 'package:flutter/material.dart';
import 'package:maki_flutter_playground/features/hospital/detail/blocs/vm_hospital_detail/vm_hospital_detail_bloc.dart';
import 'package:maki_flutter_playground/features/hospital/select/hospital_select.dart';
import 'package:maki_flutter_playground/bootstrap/manager/bootstrap_manager.dart';


class HospitalDetailProfileView extends StatefulWidget {
  const HospitalDetailProfileView({
    super.key
  });

  @override
  State<HospitalDetailProfileView> createState() => _HospitalDetailProfileViewState();
}

class _HospitalDetailProfileViewState extends State<HospitalDetailProfileView> {

  late final ScrollController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
        thumbVisibility: true,
        controller: _controller,
        child: SingleChildScrollView(
          controller: _controller,
          padding: context.dsSize.paddingScroll,
          child: _Profile()
        )
    );
  }
}


class _Profile extends StatelessWidget {
  const _Profile();

  @override
  Widget build(BuildContext context) {
    final DsSize dsSize = context.dsSize;
    final DsColor dsColor = context.dsColor;
    final DsFunc dsFunc = context.dsFunc;
    return BlocSelector<VmHospitalDetailBloc, VmHospitalDetailState, DadadocHospitalDetail>(
        selector: (state) => state.detail,
        builder: (context, detail) {
          final ({bool? isOpen, String status, String time, String day, bool isToday}) convertHours = dsFunc.getBusinessHoursText(businessHours: detail.businessHours);
          return Column(
              children: [
                UiLayout(
                    padding: EdgeInsets.symmetric(
                      vertical: dsSize.spacing16,
                    ),
                    child: UiImage.size(url: detail.thumbnail, size: Size(dsSize.widthCommon, dsSize.widthCommon/1.618))
                ),
                UiLayout(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            UiText.header(
                              text: detail.hospitalName,
                            ),
                            UiText.label(
                              text: convertHours.status,
                              fontWeight: FontWeight.w500,
                              color: convertHours.isOpen == true ? dsColor.primary : Colors.red,
                            ),
                          ],
                        ),
                        UiHospitalFeaturesLabel(
                            isLarge: true,
                            features: detail.features
                        ),
                        UiPad(type: PadType.height8),
                        UiHospitalTime(
                          onPressedMoreVert: () => context.bootstrap.message.dialog.dailyScheduleDialog(
                              context: context, hospitalName: detail.hospitalName, businessHours: detail.businessHours
                          ),
                          hospitalName: detail.hospitalName,
                          businessHours: detail.businessHours,
                          breakTimeHtml: detail.breakTimeHtml,
                          onlyTime: true,
                        ),
                      ],
                    ),
                ),
                _Divider(),
                UiHospitalDetailHtml(
                  label: '공지사항',
                  html: detail.noticeHtml,
                ),
                _Divider(),
                UiHospitalDetailHtml(
                  label: '의료진 소개',
                  html: detail.introduceHtml,
                ),
                _Divider(),
                UiHospitalDetailHtml(
                  label: '히스토리',
                  html: detail.historyHtml,
                ),
              ],
            );
        }
    );
  }
}


class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    final DsSize dsSize = context.dsSize;
    return Container(
      width: dsSize.widthCommon,
      height: dsSize.spacing16,
      color: context.dsColor.border,
      margin: EdgeInsets.symmetric(
        vertical: dsSize.spacing16
      ),
    );
  }
}


