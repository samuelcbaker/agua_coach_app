import 'package:agua_coach_app/core/usecase/errors/exceptions.dart';
import 'package:agua_coach_app/core/usecase/errors/failures.dart';
import 'package:agua_coach_app/modules/data/datasources/notification_datasource.dart';
import 'package:agua_coach_app/modules/data/repositories/notification_repository_impl.dart';
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

  group('#setSubscriptionNotification', () {
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
      'should return SaveOnDbFailure when datasource throws a SaveOnSharedPreferencesException',
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
  });

  group('#getSubscriptionNotification', () {
    test(
      'should calls datasource',
      () async {
        when(
          () => datasource.getSubscriptionNotification(),
        ).thenAnswer(
          (_) async => false,
        );

        final result = await repository.getSubscriptionNotification();

        expect(
          result,
          Right<Failure, bool>(false),
        );

        verify(
          () => datasource.getSubscriptionNotification(),
        ).called(1);
      },
    );

    test(
      'should return GetOnDbFailure when datasource throws a GetOnDbException',
      () async {
        when(
          () => datasource.getSubscriptionNotification(),
        ).thenThrow(
          GetOnDbException(),
        );

        final result = await repository.getSubscriptionNotification();

        expect(
          result,
          Left<Failure, bool>(GetOnDbFailure()),
        );

        verify(
          () => datasource.getSubscriptionNotification(),
        ).called(1);
      },
    );
  });
}
