import 'package:agua_coach_app/features/notification/domain/entities/notification_entity.dart';
import 'package:flutter/material.dart';

class NotificationModel extends NotificationEntity {
  const NotificationModel({
    required String title,
    required String description,
    required IconData icon,
  }) : super(
          title: title,
          description: description,
          icon: icon,
        );

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
        title: json['title'],
        description: json['description'],
        icon: IconData(json['icon']),
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'icon': icon.fontPackage,
      };
}
