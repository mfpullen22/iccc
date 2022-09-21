import "package:flutter/material.dart";
import 'package:iccc_app/pages/abstracts_page.dart';
import 'package:iccc_app/pages/chat_main_page.dart';
import 'package:iccc_app/pages/home_page.dart';
import 'package:iccc_app/pages/presenters_page.dart';
import 'package:iccc_app/pages/schedule_page.dart';

class BottomNavBarFb5 extends StatelessWidget {
  final int pageIndex;
  const BottomNavBarFb5({required this.pageIndex, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color.fromRGBO(122, 0, 25, 1);
    //const secondaryColor = Color(0xff6D28D9);
    //const accentColor = Color(0xffffffff);
    //const backgroundColor = Color(0xffffffff);
    //const errorColor = Color(0xffEF4444);

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
                  selected: pageIndex == 0,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  }),
              IconBottomBar(
                  text: "Schedule",
                  icon: Icons.date_range_outlined,
                  selected: pageIndex == 1,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SchedulePage()));
                  }),
              IconBottomBar(
                  text: "Presenters",
                  icon: Icons.group,
                  selected: pageIndex == 2,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PresentersPage()));
                  }),
              IconBottomBar(
                  text: "Abstracts",
                  icon: Icons.text_snippet_outlined,
                  selected: pageIndex == 3,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AbstractsPage()));
                  }),
              IconBottomBar(
                  text: "Chat",
                  icon: Icons.forum_outlined,
                  selected: pageIndex == 4,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ChatPage()));
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
