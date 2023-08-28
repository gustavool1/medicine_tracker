import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_tracker/pages/sign_in/sign_in.dart';
import 'package:medicine_tracker/repositories/repositories.dart';

import 'bloc/bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(
            authRepository: AuthRepository(),
          ),
        ),
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(),
        ),
        BlocProvider<PillsBloc>(
          create: (context) => PillsBloc(
            createPillBloc: CreatePillBloc(),
            medicineRepository: MedicineRepository(),
            pillRepository: PillRepository(),
          ),
        ),
        BlocProvider<CalendarBloc>(
          create: (context) => CalendarBloc(),
        ),
        BlocProvider<CreatePillBloc>(
          create: (context) => CreatePillBloc(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignInPage(),
      ),
    );
  }
}
