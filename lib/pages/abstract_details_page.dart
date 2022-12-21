import "package:flutter/material.dart";
import 'package:iccc_app/widgets/bottom_navbar.dart';
import 'package:google_fonts/google_fonts.dart';

class AbstractDetailsPage extends StatelessWidget {
  const AbstractDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Abstract Details",
              style: GoogleFonts.raleway(
                  fontSize: 24, fontWeight: FontWeight.bold)),
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Column(
            children: const [
              Text("Abstract Details Page"),
            ],
          ),
        ),
        bottomNavigationBar: const BottomNavBarFb5(pageIndex: 3),
      ),
    );
  }
}
