import 'package:agua_coach_app/features/notification/domain/entities/notification_entity.dart';

class NotificationModel extends NotificationEntity {
  const NotificationModel({
    required String title,
    required String description,
    required String iconURL,
  }) : super(
          title: title,
          description: description,
          iconURL: iconURL,
        );

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
        title: json['title'],
        description: json['description'],
        iconURL: json['iconURL'],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'iconURL': iconURL,
      };
}
