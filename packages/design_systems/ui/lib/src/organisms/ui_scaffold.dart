import 'package:ui/src/common.dart';



class UiScaffold extends StatelessWidget {
  final void Function()? callbackSystem;
  final Color? backgroundColor;
  final bool useScroll;
  final SystemUiOverlayStyle? systemUiOverlayStyle;
  final bool? resizeToAvoidBottomInset;
  final Widget? lifeCycleComponent;
  final Widget? subscriptionComponent;
  final Widget? appbar;
  final Widget? subTitle;
  final Widget body;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? bottomNavigationBar;

  const UiScaffold({super.key,
    this.callbackSystem,
    this.backgroundColor,
    this.useScroll = false,
    this.systemUiOverlayStyle,
    this.resizeToAvoidBottomInset,
    this.lifeCycleComponent,
    this.subscriptionComponent,
    this.appbar,
    this.subTitle,
    required this.body,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    final DsColor dsColor = Theme.of(context).extension<DsColor>()!;
    final DsSize dsSize = Theme.of(context).extension<DsSize>()!;
    return PopScope(
      canPop: Theme.of(context).extension<DsFunc>()!.isIos || callbackSystem == null,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        callbackSystem?.call();
      },
      child: Scaffold(
        backgroundColor: backgroundColor ?? dsColor.surface,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        appBar:  AppBar(
          systemOverlayStyle: systemUiOverlayStyle,
        ),
        body: Column(
          children: [
            lifeCycleComponent ?? const _Pad(),
            subscriptionComponent ?? const _Pad(),

            appbar ?? const _Pad(),
            subTitle ?? const _Pad(),

            switch(useScroll){
              true => _UseScroll(
                body: body,
              ),
              false =>  resizeToAvoidBottomInset == null
                  ? Expanded(
                child: SizedBox(
                  width: dsSize.widthCommon,
                  child: body,
                ),
              ) : Expanded(child: body)
            },

          ],
        ),
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}


class _UseScroll extends StatefulWidget {
  final Widget body;
  const _UseScroll({
    required this.body,
  });

  @override
  State<_UseScroll> createState() => _UseScrollState();
}

class _UseScrollState extends State<_UseScroll> {

  late final ScrollController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = ScrollController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final DsSize dsSize = Theme.of(context).extension<DsSize>()!;
    return Expanded(
        child: Scrollbar(
          controller: _controller,
          thumbVisibility: true,
          child: SingleChildScrollView(
              controller: _controller,
              child: SizedBox(
                width: dsSize.widthCommon,
                child: widget.body,
              )
          ),
        )
    );
  }
}



class _Pad extends StatelessWidget {
  const _Pad();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Theme.of(context).extension<DsSize>()!.extendsGap,
    );
  }
}