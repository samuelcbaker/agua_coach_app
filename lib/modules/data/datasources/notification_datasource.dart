abstract class INotificationDatasource {
  Future<void> setSubscriptionNotification({required bool subscribe});
  Future<bool> getSubscriptionNotification();
  Future<int> generateNotificationId();
}
