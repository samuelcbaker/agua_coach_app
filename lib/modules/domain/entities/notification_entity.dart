import 'package:equatable/equatable.dart';

class NotificationEntity extends Equatable {
  final int id;
  final String title;
  final String body;
  final DateTime scheduledDateTime;

  const NotificationEntity({
    required this.id,
    required this.title,
    required this.body,
    required this.scheduledDateTime,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        body,
        scheduledDateTime,
      ];
}
