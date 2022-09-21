import "package:flutter/material.dart";
import 'package:iccc_app/widgets/bottom_navbar.dart';
//import 'package:iccc_app/widgets/bottom_navbar.dart';

class AbstractsPage extends StatelessWidget {
  const AbstractsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Abstracts"),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: const [
            Text("Abstracts Page"),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBarFb5(pageIndex: 3),
    );
  }
}
