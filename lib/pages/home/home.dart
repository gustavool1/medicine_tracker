import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_tracker/pages/medicines/medicines.dart';
import 'package:medicine_tracker/styles/colors.dart';
import 'package:medicine_tracker/ui/calendar/calendar.dart';
import '../../bloc/bloc.dart';
import '../../ui/ui.dart';
import '../create_pill/create_pill.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.account_circle_rounded,
                      color: ColorPackage.blue,
                      size: 40,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const CreatePillPage())),
                      child: const Icon(
                        Icons.add_circle_rounded,
                        color: ColorPackage.blue,
                        size: 40,
                      ),
                    )
                  ],
                ),
                const Calendar(),
              ],
            ),
          ),
          Container(
            color: ColorPackage.defaultPrimary,
            child: const Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: PillsList(),
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
        );
      },
    );
  }
}
