import "package:flutter/material.dart";
import 'package:iccc_app/widgets/bottom_navbar.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Schedule"),
        ),
        extendBody: true,
        bottomNavigationBar: BottomNavBarFb5(),
        body: const Text("Schedule"));
  }
}
