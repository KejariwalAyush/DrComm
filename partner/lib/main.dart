import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'app/data/config/theme.dart';
import 'app/data/data.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await initServices();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(
            GetMaterialApp(
              title: "DrComm Partner",
              initialRoute: AppPages.INITIAL,
              getPages: AppPages.routes,
              color: kcAccent,
              theme: AppThemes.lightTheme,
              builder: (context, widget) {
                return ScrollConfiguration(
                    behavior: ScrollBehaviorModified(),
                    child: widget ?? Center());
              },
              onInit: initApp,
            ),
          ));
}

initServices() async {
  Get.log('starting services ...');

  if (!kIsWeb) await Get.putAsync(() => FCMService().init());
  await Get.putAsync(() => PhoneAuthService().init());

  /// Initialize APIS
  await Get.putAsync(() => Api().init());
  await Get.putAsync(() => ProfileApi().init());
  await Get.putAsync(() => SignupApi().init());
  Get.log('All services started...');
}

void initApp() async {
  Get.log('Init App');
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
