import 'package:agua_coach_app/core/usecase/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class RequestLocalNotificationPermission {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  RequestLocalNotificationPermission({required this.flutterLocalNotificationsPlugin});

  Future<Either<Failure, bool>> call() async {
    try {
      final permission = await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
      return Right(permission ?? true);
    } catch (e) {
      return Left(RequestLocalNotificationPermissionFailure());
    }
  }
}
