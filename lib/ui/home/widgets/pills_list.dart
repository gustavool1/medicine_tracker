import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_tracker/bloc/bloc.dart';
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
      return Column(
        children: state.pills.map((pill) => Pill(pill: pill)).toList(),
      );
    });
  }
}
