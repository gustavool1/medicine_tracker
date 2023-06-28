import 'package:flutter/material.dart';
import 'package:medicine_tracker/ui/home/widgets/bottom_navigator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Home')),
      bottomNavigationBar: BottomNavigator(),
    );
  }
}
