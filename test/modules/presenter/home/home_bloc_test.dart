import 'package:agua_coach_app/core/permissions/request_local_notification_permission.dart';
import 'package:agua_coach_app/core/usecase/errors/failures.dart';
import 'package:agua_coach_app/core/usecase/usecase.dart';
import 'package:agua_coach_app/modules/domain/usecase/get_subscription_notification_usecase.dart';
import 'package:agua_coach_app/modules/domain/usecase/set_subscription_notification_usecase.dart';
import 'package:agua_coach_app/modules/domain/usecase/start_schedule_notification_usecase.dart';
import 'package:agua_coach_app/modules/presenter/home/bloc/event/home_event.dart';
import 'package:agua_coach_app/modules/presenter/home/bloc/home_bloc.dart';
import 'package:agua_coach_app/modules/presenter/home/bloc/state/home_state.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../test_setup.dart';

class MockSetSubscriptionNotificationUsecase extends Mock implements SetSubscriptionNotificationUsecase {}

class MockGetSubscriptionNotificationUsecase extends Mock implements GetSubscriptionNotificationUsecase {}

class MockStartScheduleNotificationUsecase extends Mock implements StartScheduleNotificationUsecase {}

class MockRequestLocalNotificationPermission extends Mock implements RequestLocalNotificationPermission {}

void main() {
  late HomeBloc bloc;
  late SetSubscriptionNotificationUsecase setSubscriptionNotificationUsecase;
  late GetSubscriptionNotificationUsecase getSubscriptionNotificationUsecase;
  late StartScheduleNotificationUsecase startScheduleNotificationUsecase;
  late RequestLocalNotificationPermission requestLocalNotificationPermission;

  setUpAll(registerFallbackValues);

  setUp(() {
    setSubscriptionNotificationUsecase = MockSetSubscriptionNotificationUsecase();
    getSubscriptionNotificationUsecase = MockGetSubscriptionNotificationUsecase();
    startScheduleNotificationUsecase = MockStartScheduleNotificationUsecase();
    requestLocalNotificationPermission = MockRequestLocalNotificationPermission();

    bloc = HomeBloc(
      setSubscriptionNotificationUsecase: setSubscriptionNotificationUsecase,
      getSubscriptionNotificationUsecase: getSubscriptionNotificationUsecase,
      startScheduleNotificationUsecase: startScheduleNotificationUsecase,
      requestLocalNotificationPermission: requestLocalNotificationPermission,
    );
  });

  group('#HomeInitEvent', () {
    blocTest(
      'should get subscribe notification value',
      build: () {
        when(() => getSubscriptionNotificationUsecase(NoParams())).thenAnswer((_) async => const Right(true));
        return bloc;
      },
      act: (_) => bloc.add(const HomeInitEvent()),
      expect: () => [
        const HomeState.initial().copyWith(
          showLoading: true,
        ),
        const HomeState.initial().copyWith(
          showLoading: false,
          isSubscribe: true,
        ),
      ],
    );

    blocTest(
      'should get failure when getSubscriptionNotificationUsecase returns error',
      build: () {
        when(() => getSubscriptionNotificationUsecase(NoParams())).thenAnswer((_) async => Left(GetOnDbFailure()));
        return bloc;
      },
      act: (_) => bloc.add(const HomeInitEvent()),
      expect: () => [
        const HomeState.initial().copyWith(
          showLoading: true,
        ),
        const HomeState.initial().copyWith(
          showLoading: false,
          failure: GetOnDbFailure(),
        ),
      ],
    );
  });

  group('#ChangeSubscribeNotificationEvent', () {
    blocTest(
      'should set subscribe notification value',
      build: () {
        when(
          () => requestLocalNotificationPermission(),
        ).thenAnswer(
          (_) async => const Right(true),
        );

        when(() => setSubscriptionNotificationUsecase(
              const SetSubscriptionNotificationParams(subscribe: true),
            )).thenAnswer(
          (_) async => const Right(null),
        );

        when(
          () => startScheduleNotificationUsecase(any()),
        ).thenAnswer(
          (_) async => const Right(1),
        );

        return bloc;
      },
      act: (_) => bloc.add(const ChangeSubscribeNotificationEvent(true)),
      expect: () => [
        const HomeState.initial().copyWith(
          showLoading: true,
        ),
        const HomeState.initial().copyWith(
          showLoading: false,
          isSubscribe: true,
        ),
      ],
    );

    blocTest(
      'should get failure when getSubscriptionNotificationUsecase returns error',
      build: () {
        when(
          () => requestLocalNotificationPermission(),
        ).thenAnswer(
          (_) async => const Right(true),
        );

        when(() => setSubscriptionNotificationUsecase(
              const SetSubscriptionNotificationParams(subscribe: true),
            )).thenAnswer(
          (_) async => Left(SaveOnDbFailure()),
        );

        return bloc;
      },
      act: (_) => bloc.add(const ChangeSubscribeNotificationEvent(true)),
      expect: () => [
        const HomeState.initial().copyWith(
          showLoading: true,
        ),
        const HomeState.initial().copyWith(
          showLoading: false,
          failure: SaveOnDbFailure(),
        ),
      ],
    );

    blocTest(
      'should get LocalNotificationPermissionRejectedFailure when permission was rejected',
      build: () {
        when(
          () => requestLocalNotificationPermission(),
        ).thenAnswer(
          (_) async => const Right(false),
        );
        return bloc;
      },
      act: (_) => bloc.add(const ChangeSubscribeNotificationEvent(true)),
      expect: () => [
        const HomeState.initial().copyWith(
          showLoading: true,
        ),
        const HomeState.initial().copyWith(
          showLoading: false,
          failure: LocalNotificationPermissionRejectedFailure(),
        ),
      ],
    );
  });
}
