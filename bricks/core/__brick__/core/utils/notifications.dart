// ignore_for_file: avoid_print
import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  handleNotification(message);
}

void handleNotification(RemoteMessage? message) {
  if (message != null) {
    // final data = message.data;
  }
}

class RemoteNotificationServices {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static Future<void> initialize() async {
    await requestPermission();
    await getFcmToken().then((value) => print('FCM Token: $value'));
    await initPushNotification();
    await LocalNotificationServices.init();
  }

  static Future<void> initPushNotification() async {
    await messaging.setForegroundNotificationPresentationOptions(alert: true, badge: true, sound: true);
    FirebaseMessaging.onMessageOpenedApp.listen(handleNotification);
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessage.listen((message) async {
      await LocalNotificationServices.showNotification(message);
    });
  }

  static Stream<RemoteMessage> get onMessage => FirebaseMessaging.onMessage;

  /// Handles the initial notification.
  ///
  /// This method is responsible for handling the initial notification when the app is launched from terminated.
  /// It can be used to perform any necessary actions based on the notification data.
  static void handleInitialNotification() => messaging.getInitialMessage().then(handleNotification);

  static Future<void> requestPermission() async {
    await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  static Future<String?> getFcmToken() async => await messaging.getToken();

  static Future<void> deleteToken() async => messaging.deleteToken();
}

class LocalNotificationServices {
  static final FlutterLocalNotificationsPlugin _notification = FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    _notification
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const ios = DarwinInitializationSettings();
    const setting = InitializationSettings(android: android, iOS: ios);
    await _notification.initialize(
      setting,
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
      onDidReceiveNotificationResponse: (notificationResponse) async {
        if (notificationResponse.payload != null) {
          final remoteMessage = RemoteMessage.fromMap(jsonDecode(notificationResponse.payload!));
          handleNotification(remoteMessage);
        }
      },
    );
  }

  static Future<NotificationDetails> getNotificationDetails() async {
    const androidPlatformChannel = AndroidNotificationDetails(
      "high_importance_channel",
      "High Importance Notifications",
      importance: Importance.max,
      priority: Priority.high,
    );
    const iOSPlatformChannel = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
      interruptionLevel: InterruptionLevel.critical,
    );
    return const NotificationDetails(android: androidPlatformChannel, iOS: iOSPlatformChannel);
  }

  static Future<void> showNotification(RemoteMessage notification) async {
    final details = await getNotificationDetails();
    await _notification.show(
      notification.hashCode,
      notification.notification?.title,
      notification.notification?.body,
      details,
      payload: jsonEncode(notification.toMap()),
    );
  }
}

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  final remoteMessage = RemoteMessage.fromMap(jsonDecode(notificationResponse.payload!));
  handleNotification(remoteMessage);
}
