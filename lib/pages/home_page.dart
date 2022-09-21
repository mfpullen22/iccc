import "package:flutter/material.dart";
import 'package:iccc_app/pages/abstracts_page.dart';
import 'package:iccc_app/pages/chat_page.dart';
import 'package:iccc_app/pages/conference_info.dart';
import 'package:iccc_app/pages/presenters_page.dart';
import 'package:iccc_app/pages/schedule_page.dart';
import 'package:iccc_app/widgets/nav_card.dart';
import 'package:iccc_app/widgets/top_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        const SizedBox(height: 20),
        const TopCard(),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            NavCard(route: SchedulePage(), title: "Schedule", widthMod: 0.45),
            SizedBox(width: 20),
            NavCard(
                route: PresentersPage(), title: "Presenters", widthMod: 0.45),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            NavCard(route: AbstractsPage(), title: "Abstracts", widthMod: 0.45),
            SizedBox(width: 20),
            NavCard(route: ChatPage(), title: "Live Chat", widthMod: 0.45),
          ],
        ),
        const SizedBox(height: 20),
        const NavCard(
            route: ConferenceInfo(), title: "Conference Info", widthMod: 0.95),
      ]),
    );
  }
}
