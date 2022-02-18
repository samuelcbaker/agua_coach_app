import 'package:agua_coach_app/core/db/db_client.dart';
import 'package:agua_coach_app/core/usecase/errors/exceptions.dart';
import 'package:agua_coach_app/modules/data/datasources/notification_datasource.dart';

const SUBSCRIBE_NOTIFICATION_KEY = 'SUBSCRIBE_NOTIFICATION_KEY';

class NotificationDatasourceImpl implements INotificationDatasource {
  final IDbClient dbClient;

  NotificationDatasourceImpl({required this.dbClient});

  @override
  Future<void> setSubscriptionNotification({required bool subscribe}) async {
    try {
      await dbClient.setBool(SUBSCRIBE_NOTIFICATION_KEY, subscribe);
    } catch (e) {
      throw SaveOnDbException();
    }
  }

  @override
  Future<bool> getSubscriptionNotification() async {
    try {
      return dbClient.getBool(SUBSCRIBE_NOTIFICATION_KEY);
    } catch (e) {
      throw GetOnDbException();
    }
  }
}
