import 'package:agua_coach_app/core/usecase/errors/exceptions.dart';
import 'package:agua_coach_app/core/usecase/errors/failures.dart';
import 'package:agua_coach_app/features/notification/data/datasources/notification_datasource.dart';
import 'package:agua_coach_app/features/notification/data/repositories/notification_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockNotificationDatasource extends Mock implements INotificationDatasource {}

void main() {
  late NotificationRepositoryImpl repository;
  late INotificationDatasource datasource;

  setUp(() {
    datasource = MockNotificationDatasource();
    repository = NotificationRepositoryImpl(
      datasource: datasource,
    );
  });

  void mockVoidReturn() {
    return;
  }

  test(
    'should calls datasource',
    () async {
      when(
        () => datasource.setSubscriptionNotification(subscribe: true),
      ).thenAnswer(
        (_) async => mockVoidReturn,
      );

      final result = await repository.setSubscriptionNotification(subscribe: true);

      expect(
        result,
        Right<Failure, void>(mockVoidReturn),
      );

      verify(
        () => datasource.setSubscriptionNotification(subscribe: true),
      ).called(1);
    },
  );

  test(
    'should return SaveOnSharedPreferencesFailure when datasource throws a SaveOnSharedPreferencesException',
    () async {
      when(
        () => datasource.setSubscriptionNotification(subscribe: true),
      ).thenThrow(
        SaveOnDbException(),
      );

      final result = await repository.setSubscriptionNotification(subscribe: true);

      expect(
        result,
        Left<Failure, void>(SaveOnDbFailure()),
      );

      verify(
        () => datasource.setSubscriptionNotification(subscribe: true),
      ).called(1);
    },
  );
}
