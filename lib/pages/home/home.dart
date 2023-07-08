import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_tracker/pages/create_pill/create_pill.dart';
import 'package:medicine_tracker/pages/medicines/medicines.dart';
import 'package:medicine_tracker/styles/colors.dart';
import '../../bloc/bloc.dart';
import '../../ui/ui.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget getContent(int index) {
    switch (index) {
      case 0:
        return homeContent;

      case 1:
        return const MedicinesPage();

      default:
        return homeContent;
    }
  }

  Widget get homeContent => Container(
        color: ColorPackage.defaultPrimary,
        child: const Padding(
          padding: EdgeInsets.only(top: 16.0),
          child: PillsList(),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: ColorPackage.white,
            title: Row(
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
          ),
          body: getContent(state.index),
          bottomNavigationBar: const BottomNavigator(),
        );
      },
    );
  }
}
