
// ignore_for_file: file_names

/* import "package:flutter/material.dart";
//import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iccc_app/pages/abstracts_page.dart';
import 'package:iccc_app/pages/chat_page.dart';
import 'package:iccc_app/pages/home_page.dart';
//import 'package:iccc_app/pages/conference_info.dart';
import 'package:iccc_app/pages/presenters_page.dart';
import 'package:iccc_app/pages/schedule_page.dart';
//import 'package:iccc_app/pages/set_username.dart';
//import 'package:iccc_app/providers.dart';
//import 'package:iccc_app/widgets/bottom_navbar.dart';
//import 'package:iccc_app/widgets/nav_card.dart';
//import 'package:iccc_app/widgets/top_card.dart';
//import "package:firebase_auth/firebase_auth.dart";
import "package:iccc_app/widgets/icon_bottom_bar.dart";

class NavHome extends StatefulWidget {
  const NavHome({Key? key}) : super(key: key);

  @override
  State<NavHome> createState() => _NavHomeState();
}

class _NavHomeState extends State<NavHome> {
  final primaryColor = const Color.fromRGBO(122, 0, 25, 1);

  int _selectedIndex = 0;

  final screen = [
    const HomePage(),
    const SchedulePage(),
    const PresentersPage(),
    const AbstractsPage(),
    const ChatPage(),
  ];
  final titles = [
    "Home",
    "Schedule",
    "Presenters",
    "Abstracts",
    "Conference Chat"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(titles[_selectedIndex]),
      ),
      extendBody: true,
      body: screen[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        color: primaryColor,
        child: SizedBox(
          height: 56,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconBottomBar(
                    text: "Home",
                    icon: Icons.home,
                    selected: _selectedIndex == 0,
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 0;
                      });
                    }),
                IconBottomBar(
                    text: "Schedule",
                    icon: Icons.date_range_outlined,
                    selected: _selectedIndex == 1,
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 1;
                      });
                    }),
                IconBottomBar(
                    text: "Presenters",
                    icon: Icons.group,
                    selected: _selectedIndex == 2,
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 2;
                      });
                    }),
                IconBottomBar(
                    text: "Abstracts",
                    icon: Icons.text_snippet_outlined,
                    selected: _selectedIndex == 3,
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 3;
                      });
                    }),
                IconBottomBar(
                    text: "Chat",
                    icon: Icons.forum_outlined,
                    selected: _selectedIndex == 4,
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 4;
                      });
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*         actions: [
            IconButton(
                onPressed: () {
                  ref.read(firebaseAuthProvider).signOut();
                },
                icon: const Icon(Icons.logout, color: Colors.white))
          ], */
 */