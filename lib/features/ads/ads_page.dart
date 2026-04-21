import 'package:core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maki_flutter_playground/utils/extensions/my_extension.dart';


class AdsPage extends StatelessWidget {
  const AdsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) {
        if(didPop) {
          return;
        }
      },
      child: const _StandByBackGroundImage(),

    );
  }
}

class _StandByBackGroundImage extends StatefulWidget {
  const _StandByBackGroundImage();

  @override
  State<_StandByBackGroundImage> createState() => _StandByBackGroundImageState();
}

class _StandByBackGroundImageState extends State<_StandByBackGroundImage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try{
        await Future.delayed(Duration(seconds: 1));
        context.global.redirection.gotoHome(context);
      } catch(_){

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return switch(kIsWeb){
      true => const _WebImageArea(),
      false => const _AppImageArea()
    };
  }
}


class _AppImageArea extends StatelessWidget {

  const _AppImageArea();

  @override
  Widget build(BuildContext context) {

    return SizedBox.expand(
      child: GestureDetector(
        onTap: (){
          if (kDebugMode) {

          }
        },
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage(imageAds)
              )
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              elevation: 0,
              toolbarHeight: 0,
              backgroundColor: Colors.transparent,
              systemOverlayStyle: SystemUiOverlayStyle.dark,
            ),
          ),
        ),
      ),
    );
  }
}

class _WebImageArea extends StatelessWidget {

  const _WebImageArea();

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage('assets/images/ads/ads.png')
            )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
          ),
        ),
      ),
    );
  }
}




