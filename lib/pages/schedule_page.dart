import "package:flutter/material.dart";
import 'package:iccc_app/widgets/bottom_navbar.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Schedule"),
        automaticallyImplyLeading: false,
      ),
      body: const Text("Schedule"),
      bottomNavigationBar: const BottomNavBarFb5(pageIndex: 1),
    );
  }
}
