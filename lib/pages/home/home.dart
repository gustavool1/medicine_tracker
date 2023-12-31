import 'dart:async';

import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_tracker/helpers/helper.dart';
import 'package:medicine_tracker/pages/medicines/medicines.dart';
import 'package:medicine_tracker/styles/colors.dart';
import 'package:medicine_tracker/ui/calendar/calendar.dart';
import '../../bloc/bloc.dart';
import '../../ui/ui.dart';
import '../create_medicine/create_medicine.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static StreamSubscription? subscription;

  @override
  void initState() {
    super.initState();
    subscription ??= Alarm.ringStream.stream.listen(
      (alarmSettings) => navigateToRingScreen(alarmSettings.id),
    );

    final authBloc = context.read<AuthBloc>();
    AuthHelper()
        .initializeAuthInfo()
        .then((authInfo) => authBloc.authInfo = authInfo);
  }

  navigateToRingScreen(int id) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MedicineActions(
          alarmPillId: id,
        ),
      ),
    );
  }

  Widget getContent(int index, BuildContext context) {
    switch (index) {
      case 0:
        return homeContent(context);

      case 1:
        return const MedicinesPage();

      default:
        return homeContent(context);
    }
  }

  Widget homeContent(BuildContext context) => Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: ColorPackage.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(45),
                bottomRight: Radius.circular(45),
              ),
            ),
            child: const Calendar(),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Container(
                color: ColorPackage.defaultPrimary,
                child: const PillsList(),
              ),
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
            body: SafeArea(child: getContent(state.index, context)),
            bottomNavigationBar: const BottomNavigator(),
            floatingActionButton: FloatingActionButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CreateMedicinePage()),
              ),
              backgroundColor: ColorPackage.blue,
              child: const Icon(Icons.add),
            ));
      },
    );
  }
}
