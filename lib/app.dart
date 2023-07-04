import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc.dart';
import 'ui/ui.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(),
        ),
        BlocProvider<PillsBloc>(
          create: (context) => PillsBloc(),
        ),
        BlocProvider<CalendarBloc>(
          create: (context) => CalendarBloc(),
        ),
        BlocProvider<CreatePillBloc>(
          create: (context) => CreatePillBloc(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
