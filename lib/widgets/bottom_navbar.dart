import "package:flutter/material.dart";
import 'package:iccc_app/pages/abstracts_page.dart';
import 'package:iccc_app/pages/chat_page.dart';
import 'package:iccc_app/pages/conference_info.dart';
import 'package:iccc_app/pages/home_page.dart';
import 'package:iccc_app/pages/presenters_page.dart';
import 'package:iccc_app/pages/schedule_page.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNavBarFb5 extends StatefulWidget {
  BottomNavBarFb5({Key? key}) : super(key: key);

  @override
  State<BottomNavBarFb5> createState() => _BottomNavBarFb5State();
}

class _BottomNavBarFb5State extends State<BottomNavBarFb5> {
  final primaryColor = const Color.fromRGBO(122, 0, 25, 1);
  final secondaryColor = const Color(0xff6D28D9);
  final accentColor = const Color(0xffffffff);
  final backgroundColor = const Color(0xffffffff);
  final errorColor = const Color(0xffEF4444);
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
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
    );
  }
}

class IconBottomBar extends StatelessWidget {
  const IconBottomBar(
      {Key? key,
      required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed})
      : super(key: key);
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;

  final primaryColor = const Color(0xff4338CA);
  final accentColor = const Color(0xffffffff);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          icon:
              Icon(icon, size: 25, color: selected ? accentColor : Colors.grey),
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 12,
              height: .1,
              color: selected ? accentColor : Colors.grey),
        )
      ],
    );
  }
}
