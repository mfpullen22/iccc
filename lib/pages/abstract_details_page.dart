import "package:flutter/material.dart";
import 'package:iccc_app/pages/profile_page.dart';
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
  final String degree;
  final String imageName;
  final String position;
  final String email;
  final List<Map<String, dynamic>> totalList;
  const AbstractDetailsPage(
      {required this.name,
      required this.university,
      required this.title,
      required this.abs,
      required this.oral,
      required this.day,
      required this.time,
      required this.degree,
      required this.imageName,
      required this.position,
      required this.email,
      required this.totalList,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String timeString = time.toString();
    String formattedTime =
        "${timeString.substring(0, timeString.length - 2)}:${timeString.substring(timeString.length - 2)}";
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Abstract Details",
              style: GoogleFonts.raleway(
                  fontSize: 24, fontWeight: FontWeight.bold)),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              children: [
                Card(
                  elevation: 5,
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfilePage(
                              name: name,
                              university: university,
                              position: position,
                              email: email,
                              degree: degree,
                              totalList: totalList,
                              imageName: imageName),
                        ),
                      );
                    },
                    title: Text(
                      "$name $degree",
                      style: GoogleFonts.raleway(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      university,
                      style: GoogleFonts.raleway(fontSize: 14),
                    ),
                    trailing: const Icon(Icons.arrow_forward, size: 24),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  title,
                  style: GoogleFonts.raleway(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                oral == "y"
                    ? Text("Oral Presentation: January $day - $formattedTime",
                        style: GoogleFonts.raleway(fontSize: 16))
                    : Text("Poster Presentation",
                        style: GoogleFonts.raleway(fontSize: 16)),
                const SizedBox(height: 10),
                Text(abs, style: GoogleFonts.raleway(fontSize: 14)),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const BottomNavBarFb5(pageIndex: 3),
      ),
    );
  }
}
