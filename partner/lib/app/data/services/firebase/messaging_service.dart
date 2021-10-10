import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class FCMService extends GetxService {
  late FirebaseMessaging messaging;
  late String? fcmToken;
  Future<FCMService> init() async {
    messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }

    fcmToken = await messaging.getToken();
    Get.log(fcmToken ?? 'No Token Found');

    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage?.data['type'] == 'stat') {
      // Navigator.pushNamed(context, '/chat',
      //     arguments: ChatArguments(initialMessage));
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    //   if (message.data['type'] == 'chat') {
    //     Get.toNamed('/chat',
    //         arguments: ChatArguments(message));
    //   }
    // });

    return this;
  }
}
