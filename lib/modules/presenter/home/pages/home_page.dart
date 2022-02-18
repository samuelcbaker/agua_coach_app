import 'package:agua_coach_app/injection_container.dart';
import 'package:agua_coach_app/modules/presenter/home/bloc/event/home_event.dart';
import 'package:agua_coach_app/modules/presenter/home/bloc/home_bloc.dart';
import 'package:agua_coach_app/modules/presenter/home/bloc/state/home_state.dart';
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
        return sl<HomeBloc>()..add(HomeInitEvent());
      },
      child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
        return Scaffold(
          body: Center(
            child: state.showLoading ? CircularProgressIndicator() : Text('Teste de página'),
          ),
        );
      }),
    );
  }
}
