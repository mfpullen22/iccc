import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:iccc_app/widgets/bottom_navbar.dart';

class SetProfilePage extends StatelessWidget {
  const SetProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var username = TextEditingController();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Set Profile",
              style: GoogleFonts.raleway(
                  fontSize: 24, fontWeight: FontWeight.bold)),
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Column(
            children: const [],
          ),
        ),
        bottomNavigationBar: const BottomNavBarFb5(pageIndex: 4),
      ),
    );
  }
}
