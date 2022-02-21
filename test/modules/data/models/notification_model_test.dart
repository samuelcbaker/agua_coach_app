import 'dart:convert';

import 'package:agua_coach_app/core/usecase/errors/exceptions.dart';
import 'package:agua_coach_app/modules/data/models/notification_model.dart';
import 'package:agua_coach_app/modules/domain/entities/notification_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/notification_mock.dart';

class MockDateTime extends Mock implements DateTime {}

void main() {
  final mockDateTime = MockDateTime();

  final notificationModelMock = NotificationModel(
    id: 1,
    title: 'Beba água',
    body: 'agora',
    scheduledDateTime: DateTime(2022, 01, 01, 10),
  );

  final notificationModelMockWithMockDateTime = NotificationModel(
    id: 1,
    title: 'Beba água',
    body: 'agora',
    scheduledDateTime: mockDateTime,
  );

  test('should be a subclass of NotificationEntity', () {
    expect(
      notificationModelMock,
      isA<NotificationEntity>(),
    );
  });

  group('#fromJson', () {
    test('should return a valid model', () {
      final jsonMap = json.decode(notificationJsonMock);
      final result = NotificationModel.fromJson(jsonMap);
      expect(result, notificationModelMock);
    });

    test('throw a StringToDateTimeException when String.toDate() throw an exception', () {
      final jsonMap = json.decode(notificationJsonMockWithInvalidDateTime);
      expect(
        () => NotificationModel.fromJson(jsonMap),
        throwsA(StringToDateTimeException()),
      );
    });
  });
  group('#toJson', () {
    test('should return json object', () {
      final expectMap = {
        'id': 1,
        'title': 'Beba água',
        'body': 'agora',
        'scheduledDateTime': '2022-01-01T10:00:00',
      };
      final result = notificationModelMock.toJson();
      expect(result, expectMap);
    });

    test('throw a DateTimeToStringException when DateTime.toStringDate() throw an exception', () {
      expect(
        () => notificationModelMockWithMockDateTime.toJson(),
        throwsA(DateTimeToStringException()),
      );
    });
  });
}
