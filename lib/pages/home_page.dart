import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iccc_app/pages/abstracts_page.dart';
import 'package:iccc_app/pages/chat_page.dart';
import 'package:iccc_app/pages/conference_info.dart';
import 'package:iccc_app/pages/presenters_page.dart';
import 'package:iccc_app/pages/schedule_page.dart';
//import 'package:iccc_app/pages/set_username.dart';
import 'package:iccc_app/providers.dart';
import 'package:iccc_app/widgets/bottom_navbar.dart';
import 'package:iccc_app/widgets/nav_card.dart';
import 'package:iccc_app/widgets/top_card.dart';
import "package:firebase_auth/firebase_auth.dart";

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Home"),
        actions: [
          IconButton(
              onPressed: () {
                ref.read(firebaseAuthProvider).signOut();
              },
              icon: const Icon(Icons.logout, color: Colors.white))
        ],
      ),
      extendBody: true,
      bottomNavigationBar: BottomNavBarFb5(),
      body: Center(
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
              NavCard(
                  route: AbstractsPage(), title: "Abstracts", widthMod: 0.45),
              SizedBox(width: 20),
              NavCard(route: ChatPage(), title: "Live Chat", widthMod: 0.45),
            ],
          ),
          const SizedBox(height: 20),
          const NavCard(
              route: ConferenceInfo(),
              title: "Conference Info",
              widthMod: 0.95),
        ]),
      ),
    );
  }
}
