import 'package:equatable/equatable.dart';

class NotificationEntity extends Equatable {
  final String title;
  final String description;
  final String iconURL;

  const NotificationEntity({
    required this.title,
    required this.description,
    required this.iconURL,
  });

  @override
  List<Object?> get props => [
        title,
        description,
        iconURL,
      ];
}
