import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class NotificationEntity extends Equatable {
  final String title;
  final String description;
  final IconData icon;

  const NotificationEntity({
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  List<Object?> get props => [
        title,
        description,
        icon,
      ];
}
