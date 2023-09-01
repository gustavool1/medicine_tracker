import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_tracker/bloc/bloc.dart';
import 'package:medicine_tracker/styles/styles.dart';
import './pill.dart';

class PillsList extends StatelessWidget {
  final bool shouldRedirectOnTap;

  const PillsList({
    this.shouldRedirectOnTap = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PillsBloc, PillsState>(builder: (context, state) {
      if (state is PillEmpty) {
        return Center(
          child: Text(
            "Não há medicamentos para esse dia ",
            style: TextFonts.head2.copyWith(
              color: ColorPackage.darkBlue,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      }
      if (state is PillInitial) {
        context
            .read<PillsBloc>()
            .add(PillsEventGetPillsByDay(day: DateTime.now()));

        return const Center(
          child: CircularProgressIndicator(
            color: ColorPackage.blue,
          ),
        );
      }
      if (state is PillLoading) {
        return const Center(
          child: CircularProgressIndicator(
            color: ColorPackage.blue,
          ),
        );
      } else {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: state.pills.map((pill) => Pill(pill: pill)).toList(),
          ),
        );
      }
    });
  }
}
