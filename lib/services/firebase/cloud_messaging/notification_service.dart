import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static const key =
      'AAAA_nqa-XI:APA91bG7IEYLqq1pdXT9sFglM4bl-TgdCoLSTmpt0-07Hj2usV8U5I0Sd_uoSACjy-oMkA7llMU1lUoQjgrFy-EHdI4h5wJNxUkVJxCNB2Jc3TMh7Pv44zDGkrn2HZ_7IlbktwDng4j8';

  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  void initLocalNotifications() {
    const androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestCriticalPermission: true,
      requestSoundPermission: true,
    );

    const initializationSettings =
        InitializationSettings(android: androidSettings, iOS: iosSettings);

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (response) {
        log(response.payload.toString());
      },
    );
  }
}
