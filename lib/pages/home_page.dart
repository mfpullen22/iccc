import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:iccc_app/pages/abstracts_page.dart';
import 'package:iccc_app/pages/chat_main_page.dart';
import 'package:iccc_app/pages/conference_info.dart';
import 'package:iccc_app/pages/presenters_page.dart';
import 'package:iccc_app/pages/schedule_page.dart';
import 'package:iccc_app/pages/set_profile.dart';
import 'package:iccc_app/widgets/bottom_navbar.dart';
import 'package:iccc_app/widgets/nav_card.dart';
import 'package:iccc_app/widgets/sign_out.dart';
import 'package:iccc_app/widgets/top_card.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text("Home",
                style: GoogleFonts.raleway(
                    fontSize: 24, fontWeight: FontWeight.bold)),
            automaticallyImplyLeading: false,
            actions: const [
              SignOut(),
            ]),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //const SizedBox(height: 20),
                const TopCard(),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    NavCard(
                        route: SchedulePage(),
                        title: "Schedule",
                        widthMod: 0.45),
                    SizedBox(width: 20),
                    NavCard(
                        route: PresentersPage(),
                        title: "Presenters",
                        widthMod: 0.45),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const NavCard(
                        route: AbstractsPage(),
                        title: "Abstracts",
                        widthMod: 0.45),
                    const SizedBox(width: 20),
                    NavCard(
                        route: user?.displayName != null
                            ? const ChatMainPage()
                            : const SetProfilePage(),
                        title: "Live Chat",
                        widthMod: 0.45),
                  ],
                ),
                const SizedBox(height: 20),
                const NavCard(
                    route: ConferenceInfo(),
                    title: "Account and Conference Info",
                    widthMod: 0.95),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const BottomNavBarFb5(
          pageIndex: 0,
        ),
      ),
    );
  }
}
