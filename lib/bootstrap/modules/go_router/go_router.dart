import 'package:maki_flutter_playground/bootstrap/bootstrap.dart';
import 'package:maki_flutter_playground/bootstrap/modules/go_router/route/page/hospital_detail_page_route.dart';
import 'package:maki_flutter_playground/bootstrap/modules/go_router/route/page/profile_page_route.dart';


final GoRouter goRouter = GoRouter(
    routes: [
      adsScreen,
      homeScreen,

      hospitalSelectPage,
      hospitalDetailPage,
      profilePage
    ],
    redirect: goRouterRedirect,
);

GoRouterRedirect goRouterRedirect = (context, state) {
  final location = state.matchedLocation;

final rootRoutes = {
  adsScreenPath,
  homeScreenPath,

};

// Root route가 아니면 redirect 안 함 (push 자유)
if (!rootRoutes.contains(location)) return null;

  final redirectBloc = context.watch<GmRedirectionBloc>();
  final redirectState = redirectBloc.state;
  final RedirectType redirect = redirectState.redirectType;
  final String screen =
      switch(redirect){
        RedirectType.ads => adsScreenPath,
        RedirectType.home => homeScreenPath,
      };
  return screen;
};


// final location = state.matchedLocation;
//
// final rootRoutes = {
//   adsScreenPath,
//   loginScreenPath,
//   homeScreenPath,
//   profileScreenPath,
// };
//
// // Root route가 아니면 redirect 안 함 (push 자유)
// if (!rootRoutes.contains(location)) return null;
//
// final screen = switch (notifier.redirectType) {
//   RedirectType.initial => adsScreenPath,
//   RedirectType.login => loginScreenPath,
//   RedirectType.home => homeScreenPath,
//   RedirectType.profile => profileScreenPath,
// };
//
//
// return screen;