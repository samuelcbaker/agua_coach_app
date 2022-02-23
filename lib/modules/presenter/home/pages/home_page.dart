import 'package:agua_coach_app/core/usecase/errors/failures.dart';
import 'package:agua_coach_app/injection_container.dart';
import 'package:agua_coach_app/modules/presenter/home/bloc/event/home_event.dart';
import 'package:agua_coach_app/modules/presenter/home/bloc/home_bloc.dart';
import 'package:agua_coach_app/modules/presenter/home/bloc/state/home_state.dart';
import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return sl<HomeBloc>()..add(const HomeInitEvent());
      },
      child: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state.failure != null) {
            _showSnackbarError(state.failure!);
          }
        },
        child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          return Scaffold(
            body: Center(
              child: _buildBody(context, state),
            ),
          );
        }),
      ),
    );
  }

  _buildBody(BuildContext context, HomeState state) {
    return state.showLoading ? const CircularProgressIndicator() : _buildContent(context, state);
  }

  _buildContent(BuildContext context, HomeState state) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Visibility(
            visible: state.isSubscribe,
            child: Image.asset('assets/gifs/water-1.gif'),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Deseja receber notificações para beber água?'),
              Switch.adaptive(
                value: state.isSubscribe,
                onChanged: (value) => context.read<HomeBloc>().add(ChangeSubscribeNotificationEvent(value)),
              ),
            ],
          ),
          Visibility(
            visible: state.isSubscribe,
            child: Image.asset('assets/gifs/water-2.gif'),
          ),
        ],
      ),
    );
  }

  _showSnackbarError(Failure failure) {
    String message = 'Ops... Ocorreu um erro, por favor tente novamente.';
    SnackBarAction? action;

    if (failure is SaveOnDbFailure) {
      message = 'Ops... Ocorreu um erro ao tentar salvar os dados, por favor tente novamente.';
    } else if (failure is GetOnDbFailure) {
      message = 'Ops... Ocorreu um erro ao tentar buscar os dados, por favor tente novamente.';
    } else if (failure is GenerateIdFailure) {
      message = 'Ops... Ocorreu um erro ao preparar os dados para salvar, por favor tente novamente.';
    } else if (failure is StartScheduleNotificationFailure) {
      message = 'Ops... Ocorreu um erro ao programar as notificações, por favor tente novamente.';
    } else if (failure is RequestLocalNotificationPermissionFailure) {
      message = 'Ops... Ocorreu um erro ao solicitar a permissão de notificação, por favor tente novamente.';
    } else if (failure is LocalNotificationPermissionRejectedFailure) {
      message = 'Você precisa ativar a permissão de envio de notificações.';
      action = SnackBarAction(
        label: 'Ativar',
        onPressed: () {
          AppSettings.openNotificationSettings();
        },
      );
    }

    final snackBar = SnackBar(
      content: Text(message),
      action: action,
      duration: const Duration(seconds: 6),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
