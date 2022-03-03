import 'package:agua_coach_app/core/usecase/errors/exceptions.dart';
import 'package:agua_coach_app/core/usecase/errors/failures.dart';
import 'package:agua_coach_app/modules/data/datasources/schedule_notification_datasource.dart';
import 'package:agua_coach_app/modules/data/repositories/schedule_notification_repository_impl.dart';
import 'package:agua_coach_app/modules/domain/entities/notification_entity.dart';
import 'package:agua_coach_app/modules/domain/repositories/schedule_notification_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../test_setup.dart';

class MockScheduleNotificationDatasource extends Mock implements IScheduleNotificationDatasource {}

void main() {
  late IScheduleNotificationRepository repository;
  late IScheduleNotificationDatasource datasource;

  setUpAll(registerFallbackValues);

  setUp(() {
    datasource = MockScheduleNotificationDatasource();

    repository = ScheduleNotificationRepositoryImpl(
      datasource: datasource,
    );
  });

  final mockNotificationEntity = NotificationEntity(
    id: 1,
    title: 'agua',
    body: 'beba',
    scheduledDateTime: DateTime(2022, 01, 01, 10),
  );

  group('#startDailyScheduleNotification', () {
    test('should return a notification id of new schedule notification', () async {
      when(
        () => datasource.startDailyScheduleNotification(notificationEntity: any(named: 'notificationEntity')),
      ).thenAnswer(
        (_) async => 1,
      );

      final result = await repository.startDailyScheduleNotification(notificationEntity: mockNotificationEntity);

      expect(result, const Right(1));
    });

    test(
        'should return a StartScheduleNotificationFailure when occurs StartScheduleNotificationException on datasource',
        () async {
      when(
        () => datasource.startDailyScheduleNotification(notificationEntity: any(named: 'notificationEntity')),
      ).thenThrow(
        StartScheduleNotificationException(),
      );

      final result = await repository.startDailyScheduleNotification(notificationEntity: mockNotificationEntity);

      expect(result, Left(StartScheduleNotificationFailure()));
    });
  });

  void mockVoidReturn() {}

  group('#stopAllScheduleNotifications', () {
    test('should stop all scheduled notifications', () async {
      when(
        () => datasource.stopAllScheduleNotifications(),
      ).thenAnswer(
        (_) async => mockVoidReturn,
      );

      final result = await repository.stopAllScheduleNotifications();

      expect(result, Right(mockVoidReturn));
    });

    test(
        'should return a StopAllScheduledNotificationFailure when occurs StopAllScheduledNotificationException on datasource',
        () async {
      when(
        () => datasource.stopAllScheduleNotifications(),
      ).thenThrow(
        StopAllScheduledNotificationException(),
      );

      final result = await repository.stopAllScheduleNotifications();

      expect(
        result,
        Left(StopAllScheduledNotificationFailure()),
      );
    });
  });
}
