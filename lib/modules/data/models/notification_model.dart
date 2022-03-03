import 'package:agua_coach_app/modules/domain/entities/notification_entity.dart';
import 'package:agua_coach_app/utils/extensions/date_time_to_string_extension.dart';
import 'package:agua_coach_app/utils/extensions/string_to_date_time_extension.dart';

class NotificationModel extends NotificationEntity {
  const NotificationModel({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledDateTime,
  }) : super(
          id: id,
          title: title,
          body: body,
          scheduledDateTime: scheduledDateTime,
        );

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
        id: json['id'],
        title: json['title'],
        body: json['body'],
        scheduledDateTime: (json['scheduledDateTime'] as String).toDate(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'body': body,
        'scheduledDateTime': scheduledDateTime.toStringDate(),
      };
}
