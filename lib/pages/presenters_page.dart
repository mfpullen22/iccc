import "package:flutter/material.dart";
import "package:iccc_app/data/speakers.dart";
import 'package:iccc_app/widgets/bottom_navbar.dart';
import 'package:iccc_app/widgets/speakers_tile.dart';

class PresentersPage extends StatelessWidget {
  const PresentersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Presenters"),
      ),
      extendBody: true,
      bottomNavigationBar: BottomNavBarFb5(),
      body: ListView.builder(
        itemCount: speakers.length,
        itemBuilder: (context, index) {
          final speaker = speakers[index];
          return Padding(
            padding: const EdgeInsets.all(8.5),
            child: SpeakerTile(
              name: speaker["name"],
              university: speaker["university"],
              title: speaker["title"],
              position: speaker["position"],
              email: speaker["email"],
            ),
          );
        },
      ),
    );
  }
}
