import 'package:agua_coach_app/injection_container.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<bool> requestLocalNotificationPermission() async {
  final flutterLocalNotificationsPlugin = sl<FlutterLocalNotificationsPlugin>();
  final permission = await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
      ?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
  return permission ?? true;
}
