import 'dart:convert';

import 'package:agua_coach_app/modules/data/models/notification_model.dart';
import 'package:agua_coach_app/modules/domain/entities/notification_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../mocks/mocks.dart';

void main() {
  const notificationModelMock = NotificationModel(
    title: 'Beba água',
    description: 'agora',
    iconURL: 'link.com',
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
      'title': 'Beba água',
      'description': 'agora',
      'iconURL': 'link.com',
    };
    final result = notificationModelMock.toJson();
    expect(result, expectMap);
  });
}
