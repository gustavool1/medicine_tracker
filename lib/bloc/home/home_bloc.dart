import 'package:bloc/bloc.dart';
import 'package:medicine_tracker/bloc/home/home_event.dart';
import 'package:medicine_tracker/bloc/home/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState());
}
