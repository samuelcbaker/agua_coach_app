import 'package:agua_coach_app/core/usecase/usecase.dart';
import 'package:agua_coach_app/modules/domain/usecase/get_subscription_notification_usecase.dart';
import 'package:agua_coach_app/modules/domain/usecase/set_subscription_notification_usecase.dart';
import 'package:agua_coach_app/modules/presenter/home/bloc/event/home_event.dart';
import 'package:agua_coach_app/modules/presenter/home/bloc/state/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final SetSubscriptionNotificationUsecase setSubscriptionNotificationUsecase;
  final GetSubscriptionNotificationUsecase getSubscriptionNotificationUsecase;

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  HomeBloc({
    required this.setSubscriptionNotificationUsecase,
    required this.getSubscriptionNotificationUsecase,
    required this.flutterLocalNotificationsPlugin,
  }) : super(const HomeState.initial()) {
    on<HomeInitEvent>(_handleInitEvent);
    on<ChangeSubscribeNotificationEvent>(_handleChangeSubscribeNotificationEvent);

    _configNotification();
  }

  Future<void> _handleInitEvent(HomeEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(showLoading: true));
    final subscribeResult = await getSubscriptionNotificationUsecase(NoParams());
    subscribeResult.fold(
      (left) {
        emit(state.copyWith(showLoading: false, failure: left));
      },
      (right) {
        emit(state.copyWith(showLoading: false, isSubscribe: right));
      },
    );
    _requestPermissions();
  }

  Future<void> _handleChangeSubscribeNotificationEvent(
      ChangeSubscribeNotificationEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(showLoading: true));
    final result = await setSubscriptionNotificationUsecase(
      SetSubscriptionNotificationParams(subscribe: event.value),
    );
    result.fold(
      (left) {
        emit(state.copyWith(showLoading: false, failure: left));
      },
      (right) {
        emit(state.copyWith(showLoading: false, isSubscribe: event.value));

        event.value ? _startJob() : _stopJob();
      },
    );
  }

  _configNotification() async {
    await _configureLocalTimeZone();
    await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
    final IOSInitializationSettings initializationSettingsIOS = IOSInitializationSettings(
        requestAlertPermission: false,
        requestBadgePermission: false,
        requestSoundPermission: false,
        onDidReceiveLocalNotification: (
          int id,
          String? title,
          String? body,
          String? payload,
        ) async {
          print(
            {
              id: id,
              title: title,
              body: body,
              payload: payload,
            },
          );
        });
    final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
      macOS: null,
      linux: null,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void _requestPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  Future<void> _showNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'your channel id', 'your channel name',
        channelDescription: 'your channel description',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker');
    const NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(0, 'plain title', 'plain body', platformChannelSpecifics,
        payload: 'item x');
  }

  _stopJob() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  _startJob() async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'daily scheduled notification title',
        'daily scheduled notification body',
        _nextInstanceOfTenAM(),
        const NotificationDetails(
            // android: AndroidNotificationDetails('daily notification channel id', 'daily notification channel name',
            //     channelDescription: 'daily notification description'),
            ),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time);
  }

  tz.TZDateTime _nextInstanceOfTenAM() {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate = tz.TZDateTime(tz.local, now.year, now.month, now.day, 12, 36);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

  Future<void> _configureLocalTimeZone() async {
    tz.initializeTimeZones();
    final String? timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName!));
  }
}
