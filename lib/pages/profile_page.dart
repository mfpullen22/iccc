import "package:flutter/material.dart";
import 'package:iccc_app/widgets/bottom_navbar.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  final String name;
  final String university;
  final String position;
  final String email;
  final String title;
  final List<Map<String, dynamic>> totalList;
  const ProfilePage(
      {required this.name,
      required this.university,
      required this.position,
      required this.email,
      required this.title,
      required this.totalList,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final presentations = [];
    for (var item in totalList) {
      if (item["email"] == email) {
        if (item["title"] == "") {
          presentations.add("Section Talk");
        } else {
          presentations.add(item["title"]);
        }
      }
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("$name's Profile"),
          centerTitle: true,
        ),
        extendBody: true,
        bottomNavigationBar: const BottomNavBarFb5(
          pageIndex: 5,
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                width: screenSize.width * 0.95,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.5),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(10, 5),
                        blurRadius: 10,
                        spreadRadius: 10,
                        color: Colors.grey.withOpacity(0.7),
                      )
                    ]),
                child: Column(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(0),
                        child: const Icon(Icons.account_circle, size: 200)),
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        "$name, $title",
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        position,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          university,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                          ),
                        )),
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        "Contact: $email",
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: screenSize.width * 0.95,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.5),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(10, 5),
                        blurRadius: 10,
                        spreadRadius: 10,
                        color: Colors.grey.withOpacity(0.7),
                      )
                    ]),
                child: Column(
                  children: [
                    Text("Presentations",
                        style: GoogleFonts.raleway(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline)),
                    const SizedBox(height: 10),
                    for (var presentation in presentations)
                      Text(presentation,
                          style: GoogleFonts.raleway(
                              fontSize: 16, fontWeight: FontWeight.bold))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
