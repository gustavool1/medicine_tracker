class HomeEvent {}

class HomeEventChangeBottomNavigator extends HomeEvent {
  final int index;
  HomeEventChangeBottomNavigator({required this.index});
}
