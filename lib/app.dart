import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_tracker/pages/register/register_page.dart';
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
            medicineBloc: MedicineBloc(
              medicineRepository: MedicineRepository(),
            ),
            medicineRepository: MedicineRepository(),
            pillRepository: PillRepository(),
          ),
        ),
        BlocProvider<CalendarBloc>(
          create: (context) => CalendarBloc(),
        ),
        BlocProvider<MedicineBloc>(
          create: (context) => MedicineBloc(
            medicineRepository: MedicineRepository(),
          ),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: RegisterPage(),
      ),
    );
  }
}
