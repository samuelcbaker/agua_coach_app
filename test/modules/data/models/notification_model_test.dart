import 'dart:convert';

import 'package:agua_coach_app/modules/data/models/notification_model.dart';
import 'package:agua_coach_app/modules/domain/entities/notification_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../mocks/notification_mock.dart';

void main() {
  final notificationModelMock = NotificationModel(
    id: 1,
    title: 'Beba água',
    body: 'agora',
    scheduledDateTime: DateTime(2022, 01, 01, 10),
  );

  test('should be a subclass of NotificationEntity', () {
    expect(
      notificationModelMock,
      isA<NotificationEntity>(),
    );
  });

  test('should return a valid model', () {
    final jsonMap = json.decode(notificationJsonMock);
    final result = NotificationModel.fromJson(jsonMap);
    expect(result, notificationModelMock);
  });

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
}
