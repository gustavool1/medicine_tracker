import 'package:flutter/material.dart';
import 'package:medicine_tracker/styles/colors.dart';
import 'package:medicine_tracker/pages/create_pill/create_pill.dart';
import '../../ui/ui.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const CreatePillPage())),
              child: const Icon(
                Icons.add_circle_rounded,
                color: ColorPackage.blue,
                size: 40,
              ),
            )
          ],
        ),
      ),
      body: Container(
        color: ColorPackage.defaultPrimary,
        child: const Padding(
          padding: EdgeInsets.only(top: 16.0),
          child: PillsList(),
        ),
      ),
      bottomNavigationBar: const BottomNavigator(),
    );
  }
}
