// import 'dart:async';
//
// class AppConfig {
//
//   void onBoardingStatue() {
//     Timer(const Duration(seconds: 5), () {
//       checkFirstSeen();
//     });
//   }
//
//   Future<void> checkFirstSeen() async {
//     bool seen = await pef.getShowOnce();
//     bool isAuthenticated = sl<SharedPrefController>().getUserData().uid != "";
//     print("is Auth ? $isAuthenticated");
//     if (seen) {
//       if (isAuthenticated) {
//         nav.goToAndRemove(screenName: ScreenName.BNBUser);
//       } else {
//         nav.goToAndRemove(screenName: ScreenName.loginScreen);
//       }
//     } else {
//       sl<SharedPrefController>().setShowOnce(true);
//       nav.goToAndRemove(screenName: ScreenName.pageViewScreens);
//     }
//   }
// }
