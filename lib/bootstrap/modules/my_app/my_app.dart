import 'dart:io';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:maki_flutter_playground/bootstrap/bootstrap.dart';




class MyApp extends StatelessWidget {
  final SharedPreferences prefs;
  final Dio dio;
  const MyApp({super.key,
    required this.prefs,
    required this.dio,
  });

  @override
  Widget build(BuildContext context) {
    if(kDebugMode){
      log('리팩토링 테스트: MyApp');
    }
    return PackagesProvider(
        prefs: prefs,
        dio: dio,
        managerProviders: [

          RepositoryProvider<MessageController>(
              create: (BuildContext context) =>
                  const MessageController()
          ),

          RepositoryProvider<GoRouterController>(
              create: (BuildContext context) =>
                  GoRouterController(
                      path: GoRouterPath(),
                      extra: GoRouterExtra()
                  )
          ),


          RepositoryProvider<BootstrapManager>(
              create: (BuildContext context) => BootstrapManager(
                  messageController: context.read<MessageController>(),
                  goRouterController: context.read<GoRouterController>()
              )
          )

        ],
        child: const _MyApp()
    );
  }
}


class _MyApp extends StatelessWidget {
  const _MyApp();

  @override
  Widget build(BuildContext context) {

    final double width = MediaQuery.widthOf(context);
    final double height =  MediaQuery.heightOf(context);
    final double origin = (
        width < 600
            ? width
            : (((height)*440)/956)
    );
    final double px1 = origin* 0.0022728;


    return MaterialApp.router(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ko', 'KR'), // 한국어
        Locale('en', 'US'), // 영어
      ],
      locale: Locale('ko', 'KR'),
      builder: (context, child) {
        return MediaQuery.withNoTextScaling(
            child: MyAppLoadingView(child: child!)
        );
      },
      // localizationsDelegates: const [
      //   AppLocalizations.delegate,
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],

      // supportedLocales: const [
      //   Locale('ko'),
      //   Locale('en'),
      // ],

      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      color: Colors.amberAccent,
      title: 'boomcare',
      // localizationsDelegates: FlutterLocalization.instance.localizationsDelegates,
      // supportedLocales: const [
      //   Locale('ko', 'KO'),
      // ],
      // locale: const Locale('ko'),
      theme: DsTheme(
        dsColor: DsColor(),
        dsSize: DsSize(
            widthCommon: width,
            heightCommon: height,
            base: px1,
            unit: px1*4,
            ratio: (5/8)*origin
        ),
        dsFunc: DsFunc(isIos: Platform.isIOS),
      ).data,
      // darkTheme: CssTheme(
      //     size: context.read<CssSizeImpl>()
      // ).themeDark,
    );
  }
}








// class _MyApp extends StatefulWidget {
//
//   const _MyApp();
//
//   @override
//   State<_MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<_MyApp> {
//
//   late final ThemeData _theme;
//   bool _initialized = false;
//
//   @override
//   void didChangeDependencies() {
//     // TODO: implement didChangeDependencies
//     super.didChangeDependencies();
//     if(kDebugMode){
//       log('디펜더시 동작');
//     }
//     if(_initialized == false){
//       if(kDebugMode){
//         log('테마 적용 동작');
//       }
//       _theme = CssTheme(
//           cssColor: CssColor(),
//           cssSize: CssSize(
//               widthCommon: MediaQuery.widthOf(context),
//               heightCommon: MediaQuery.heightOf(context),
//               scale: MediaQuery.widthOf(context)/1080,
//               origin: MediaQuery.widthOf(context) < 600
//                   ? MediaQuery.widthOf(context)
//                   : (((MediaQuery.heightOf(context))*440)/956),
//               px1:   (MediaQuery.widthOf(context) < 600
//                   ? MediaQuery.widthOf(context)
//                   : (((MediaQuery.heightOf(context))*440)/956))* 0.0022728
//           ),
//           cssDevice: CssDevice(
//               isHeight: Platform.isIOS,
//               isIos: Platform.isIOS
//           ),
//           cssFunc: CssFunc(),
//           font: font
//       ).themeLight;
//       _initialized = true;
//     }
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if(kDebugMode){
//       log('리빌딩 되는 중');
//     }
//     return ToastificationWrapper(
//       child: MaterialApp.router(
//         builder: (context, child) {
//           return MediaQuery.withNoTextScaling(
//               child: child!
//           );
//         },
//         locale: const Locale('ko', 'KR'),
//         supportedLocales: const [
//           Locale('en', 'US'),
//           Locale('ko', 'KR'),
//         ],
//         localizationsDelegates: const [
//           GlobalMaterialLocalizations.delegate,
//           GlobalWidgetsLocalizations.delegate,
//           GlobalCupertinoLocalizations.delegate,
//         ],
//         routerConfig: myAppRouter,
//         debugShowCheckedModeBanner: false,
//         color: Colors.amberAccent,
//         title: 'boomcare',
//         // localizationsDelegates: FlutterLocalization.instance.localizationsDelegates,
//         // supportedLocales: const [
//         //   Locale('ko', 'KO'),
//         // ],
//         // locale: const Locale('ko'),
//         theme: _theme,
//         // darkTheme: CssTheme(
//         //     size: context.read<CssSizeImpl>()
//         // ).themeDark,
//       ),
//     );
//   }
// }
