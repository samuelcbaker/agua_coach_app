import 'package:agua_coach_app/core/db/db_client.dart';
import 'package:agua_coach_app/core/usecase/errors/exceptions.dart';
import 'package:agua_coach_app/features/notification/data/datasources/notification_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';

const SUBSCRIBE_NOTIFICATION_KEY = 'SUBSCRIBE_NOTIFICATION_KEY';

class NotificationDatasourceImpl implements INotificationDatasource {
  final DbClient dbClient;

  NotificationDatasourceImpl({required this.dbClient});

  @override
  Future<void> setSubscriptionNotification({required bool subscribe}) async {
    try {
      await dbClient.setBool(SUBSCRIBE_NOTIFICATION_KEY, subscribe);
    } catch (e) {
      throw SaveOnDbException();
    }
  }
}
