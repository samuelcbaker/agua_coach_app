import 'package:agua_coach_app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:get_it/get_it.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

Future<void> start() async {
  await _configureLocalTimeZone();
  await _configureLocalNotifications();

  runApp(const WaterApp());
}

Future<void> _configureLocalTimeZone() async {
  tz.initializeTimeZones();
  final String? timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
  tz.setLocalLocation(tz.getLocation(timeZoneName!));
}

Future<void> _configureLocalNotifications() async {
  final sl = GetIt.instance;
  final flutterLocalNotificationsPlugin = sl<FlutterLocalNotificationsPlugin>();
  await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
  const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
  const IOSInitializationSettings initializationSettingsIOS = IOSInitializationSettings(
    requestAlertPermission: false,
    requestBadgePermission: false,
    requestSoundPermission: false,
  );
  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
    macOS: null,
    linux: null,
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}
