import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'app/data/config/theme.dart';
import 'app/data/data.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(
            GetMaterialApp(
              title: "DrComm Partner",
              initialRoute: AppPages.INITIAL,
              getPages: AppPages.routes,
              theme: AppThemes.lightTheme,
              builder: (context, widget) {
                return ScrollConfiguration(
                    behavior: ScrollBehaviorModified(),
                    child: widget ?? Center());
              },
              onInit: initApp,
              // onDispose: disposeApp,
            ),
          ));
}

// late final StreamSubscription<ConnectivityResult> _subscription;
// void disposeApp() => _subscription.cancel();

initServices() async {
  Get.log('starting services ...');
  await Firebase.initializeApp();

  /// Here is where you put get_storage, hive, shared_pref initialization.
  /// or moor connection, or whatever that's async.
  ///
  // await Get.putAsync(() => ReceiveIntentService().init());
  // await Get.putAsync(() => RemoteConfigService().init());
  // await Get.putAsync(() => AdService().init());
  // await Get.putAsync(() => AnalyticsService().init());

  await Get.putAsync(() => FCMService().init());
  await Get.putAsync(() => PhoneAuthService().init());

  /// Initialize APIS
  await Get.putAsync(() => Api().init());
  await Get.putAsync(() => ProfileApi().init());
  await Get.putAsync(() => SignupApi().init());
  Get.log('All services started...');
}

void initApp() async {
  Get.log('Init App');
  // Connectivity().checkConnectivity().then((value) {
  //   if (value == ConnectivityResult.none) Get.to(() => NoConnectivity());
  // });

  // _subscription =
  //     Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
  //   Get.log(result.toString());
  //   if (result == ConnectivityResult.none) {
  //     try {
  //       if (Get.find<HomeController>().pageIndex == 0)
  //         Get.find<HomeController>().updatePageIndex(2);
  //     } on Exception catch (e) {
  //       Get.log(e.toString());
  //     }
  //     Get.to(() => NoConnectivity());
  //   } else
  //     Get.back();
  // });
}

class ScrollBehaviorModified extends ScrollBehavior {
  const ScrollBehaviorModified();
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
      case TargetPlatform.android:
        return const BouncingScrollPhysics();
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return const ClampingScrollPhysics();
    }
  }
}
