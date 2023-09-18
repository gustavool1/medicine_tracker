import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/bloc.dart';

class BottomNavigator extends StatelessWidget {
  const BottomNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return BottomNavigationBar(
        onTap: (index) {
          context.read<HomeBloc>().add(
                HomeEventChangeBottomNavigator(index: index),
              );
          if (index == 0) {
            context
                .read<PillsBloc>()
                .add(PillsEventGetPillsByDay(day: DateTime.now()));
          }
        },
        currentIndex: state.index,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medication),
            label: 'Medicamentos',
          ),
        ],
      );
    });
  }
}
