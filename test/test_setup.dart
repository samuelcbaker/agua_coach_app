import 'package:agua_coach_app/modules/domain/entities/notification_entity.dart';
import 'package:mocktail/mocktail.dart';

void registerFallbackValues() {
  final values = [
    NotificationEntity(id: 1, title: '', body: '', scheduledDateTime: DateTime(2022)),
  ];

  values.forEach((value) {
    registerFallbackValue(value);
  });
}
