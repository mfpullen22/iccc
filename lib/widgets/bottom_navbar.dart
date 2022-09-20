import "package:flutter/material.dart";
import 'package:iccc_app/pages/abstracts_page.dart';
import 'package:iccc_app/pages/chat_page.dart';
import 'package:iccc_app/pages/conference_info.dart';
import 'package:iccc_app/pages/home_page.dart';
import 'package:iccc_app/pages/presenters_page.dart';
import 'package:iccc_app/pages/schedule_page.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNavBarFb5 extends StatefulWidget {
  int selectedIndex;
  BottomNavBarFb5({required this.selectedIndex, Key? key}) : super(key: key);

  @override
  State<BottomNavBarFb5> createState() => _BottomNavBarFb5State();
}

class _BottomNavBarFb5State extends State<BottomNavBarFb5> {
  final primaryColor = const Color.fromRGBO(122, 0, 25, 1);
  final secondaryColor = const Color(0xff6D28D9);
  final accentColor = const Color(0xffffffff);
  final backgroundColor = const Color(0xffffffff);
  final errorColor = const Color(0xffEF4444);

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
                  selected: widget.selectedIndex == 0,
                  onPressed: () {
                    setState(() {
                      widget.selectedIndex = 0;
                    });
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  }),
              IconBottomBar(
                  text: "Schedule",
                  icon: Icons.date_range_outlined,
                  selected: widget.selectedIndex == 1,
                  onPressed: () {
                    setState(() {
                      widget.selectedIndex = 1;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SchedulePage()));
                  }),
              IconBottomBar(
                  text: "Presenters",
                  icon: Icons.group,
                  selected: widget.selectedIndex == 2,
                  onPressed: () {
                    setState(() {
                      widget.selectedIndex = 2;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PresentersPage()));
                  }),
              IconBottomBar(
                  text: "Abstracts",
                  icon: Icons.text_snippet_outlined,
                  selected: widget.selectedIndex == 3,
                  onPressed: () {
                    setState(() {
                      widget.selectedIndex = 3;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AbstractsPage()));
                  }),
              IconBottomBar(
                  text: "Chat",
                  icon: Icons.forum_outlined,
                  selected: widget.selectedIndex == 4,
                  onPressed: () {
                    setState(() {
                      widget.selectedIndex = 4;
                    });
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ChatPage()));
                  }),
              IconBottomBar(
                  text: "Chat",
                  icon: Icons.info_outline,
                  selected: widget.selectedIndex == 5,
                  onPressed: () {
                    setState(() {
                      widget.selectedIndex = 5;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ConferenceInfo()));
                  })
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
