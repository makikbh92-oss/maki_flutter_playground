// import 'package:ui/src/common.dart';
//
// class UiTabBar extends StatefulWidget {
//   final void Function(int) callback;
//   final int currentIndex;
//   final List<String> taps;
//   final List<Widget> children;
//   final ScrollPhysics physics;
//   const UiTabBar({super.key,
//     required this.callback,
//     required this.currentIndex,
//     required this.taps,
//     required this.children,
//     this.physics = const NeverScrollableScrollPhysics()
//   });
//
//   @override
//   State<UiTabBar> createState() => _UiTabBarState();
// }
//
// class _UiTabBarState extends State<UiTabBar> with TickerProviderStateMixin {
//
//   late final TabController _tabController;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _tabController = TabController(length: widget.children.length, vsync: this, initialIndex: widget.currentIndex);
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     _tabController.dispose();
//     super.dispose();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     final DsSize dsSize = Theme.of(context).extension<DsSize>()!;
//     final DsColor dsColor = Theme.of(context).extension<DsColor>()!;
//     final DsStyle dsStyle = Theme.of(context).extension<DsStyle>()!;
//
//     return Column(
//       children: [
//         UiContainer.child(child:  Stack(
//           children: [
//             Positioned.fill(
//               bottom: 0,
//               child: Container(
//                 decoration: BoxDecoration(
//                     border: Border(
//                         bottom: BorderSide(
//                             width: dsSize.tapSide,
//                             color: dsColor.border
//                         )
//                     )
//                 ),
//               ),
//             ),
//             TabBar(
//               onTap: (index){
//                 widget.callback(index);
//               },
//               overlayColor: WidgetStateProperty.all(Colors.transparent),
//               controller: _tabController,
//               tabs: widget.taps.map((e) => Tab(
//                 text: e,
//               )).toList(),
//               indicator: BoxDecoration(
//                   border: Border(
//                       bottom: BorderSide(
//                           width: dsSize.tapSide,
//                           color: dsColor.primary
//                       )
//                   )
//               ),
//               labelPadding: EdgeInsets.symmetric(vertical: dsSize.spacing8),
//               labelStyle: dsStyle.body.copyWith(
//                   color: dsColor.primary,
//                   fontWeight: FontWeight.w600
//               ),
//               unselectedLabelStyle: dsStyle.body.copyWith(
//                   color: dsColor.unSelected,
//                   fontWeight: FontWeight.w400
//               ),
//             ),
//           ],
//         ),),
//         Expanded(
//             child: TabBarView(
//                 physics: widget.physics,
//                 controller: _tabController,
//                 children: widget.children
//             )
//         )
//       ],
//     );
//   }
// }
