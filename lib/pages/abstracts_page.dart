import "package:flutter/material.dart";
import 'package:iccc_app/widgets/bottom_navbar.dart';

class AbstractsPage extends StatelessWidget {
  const AbstractsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Abstracts"),
        ),
        extendBody: true,
        bottomNavigationBar: const BottomNavBarFb5(
          selectedIndex: 3,
        ),
        body: Center(
          child: Column(
            children: const [
              Text("Abstracts Page"),
            ],
          ),
        ));
  }
}
