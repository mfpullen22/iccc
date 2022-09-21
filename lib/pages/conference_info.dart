import "package:flutter/material.dart";
import 'package:iccc_app/widgets/bottom_navbar.dart';

class ConferenceInfo extends StatelessWidget {
  const ConferenceInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Conference Info")),
      extendBody: true,
      bottomNavigationBar: const BottomNavBarFb5(
        pageIndex: 5,
      ),
      body: Center(
        child: Column(
          children: const [
            Text("Conference Info Page"),
          ],
        ),
      ),
    );
  }
}
