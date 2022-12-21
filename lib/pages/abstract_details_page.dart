import "package:flutter/material.dart";
import 'package:iccc_app/widgets/bottom_navbar.dart';
import 'package:google_fonts/google_fonts.dart';

class AbstractDetailsPage extends StatelessWidget {
  final String name;
  final String university;
  final String title;
  final String abs;
  final String oral;
  final String day;
  final int time;
  const AbstractDetailsPage(
      {required this.name,
      required this.university,
      required this.title,
      required this.abs,
      required this.oral,
      required this.day,
      required this.time,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Abstract Details",
              style: GoogleFonts.raleway(
                  fontSize: 24, fontWeight: FontWeight.bold)),
        ),
        body: Center(
          child: Column(
            children: [
              Text(title),
              Text(name),
              Text(abs),
            ],
          ),
        ),
        bottomNavigationBar: const BottomNavBarFb5(pageIndex: 3),
      ),
    );
  }
}
