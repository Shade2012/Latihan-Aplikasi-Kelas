import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'firebase_options.dart';

class FirebaseApi {
  final firebaseMessaging = FirebaseMessaging.instance;

  static final channel = const AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Channel',
    importance: Importance.high,
  );

  static final flutterNotificationPlugin = FlutterLocalNotificationsPlugin();

  static Future<void> initLocalNotifications() async {
    final InitializationSettings initializationSettings =
        const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
    );

    await flutterNotificationPlugin.initialize(
      initializationSettings,
    );

    await flutterNotificationPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(
          channel,
        );
  }

  static Future<void> handleMessage(RemoteMessage message) async {
    if (message.notification != null) {
      RemoteNotification notification = message.notification!;
      await flutterNotificationPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            icon: '@mipmap/ic_launcher',
          ),
        ),
        payload: message.notification?.body,
      );
    }
  }

  static Future<void> handleBackgroundMessaging(RemoteMessage message) async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    if (message.notification != null) {
      await flutterNotificationPlugin.show(
        message.notification.hashCode,
        message.notification?.title,
        message.notification?.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            icon: '@mipmap/ic_launcher',
          ),
        ),
        payload: message.notification?.body,
      );
    }
  }

  Future<void> initNotifications() async {
    try {
      // Request permission for notifications
      NotificationSettings settings = await firebaseMessaging.requestPermission(
        alert: true,
        sound: true,
        badge: true,
        provisional: false,
      );
      String? notificationToken;
      await firebaseMessaging.getToken().then((value) {
        notificationToken = value;
      });
      if (kDebugMode) {
        print('notif token di firebase_api $notificationToken');
      }
      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      } else if (settings.authorizationStatus ==
          AuthorizationStatus.provisional) {
      } else {
        return; // Exit if permission not granted
      }

      // Listen for foreground messages
      FirebaseMessaging.onMessage.listen(FirebaseApi.handleMessage);

      // Handle background messages
      FirebaseMessaging.onBackgroundMessage(
        FirebaseApi.handleBackgroundMessaging,
      );

      // Initialize local notifications
      await FirebaseApi.initLocalNotifications();
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Error initializing notifications: $e');
      }
    }
  }
}
