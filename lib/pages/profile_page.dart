import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:iccc_app/widgets/bottom_navbar.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  final String name;
  final String university;
  final String position;
  final String email;
  final String degree;
  final String imageName;
  final List<Map<String, dynamic>> totalList;
  const ProfilePage(
      {required this.name,
      required this.university,
      required this.position,
      required this.email,
      required this.degree,
      required this.totalList,
      required this.imageName,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<dynamic> getImage(String path) async {
      try {
        await rootBundle.load(path);
        return path;
      } catch (_) {
        return null;
      }
    }

    final screenSize = MediaQuery.of(context).size;
    final List<Map<String, dynamic>> presentations = [];
    for (var item in totalList) {
      String timeString = item["time"].toString();
      String formattedTime =
          "${timeString.substring(0, timeString.length - 2)}:${timeString.substring(timeString.length - 2)}";
      if (item["email"] == email) {
        if (item["title"] == "") {
          presentations.add({"title": "Section Talk", "day": "0", "time": "0"});
        } else {
          presentations.add({
            "title": item["title"],
            "day": item["day"] ?? "Poster",
            "time": formattedTime
          });
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
                    FutureBuilder(
                        future: getImage("assets/img/headshots/$imageName.jpg"),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return ClipRRect(
                                borderRadius: BorderRadius.circular(0),
                                child: const Icon(Icons.account_circle,
                                    size: 200));
                          }
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: Image.asset(
                              "assets/img/headshots/$imageName.jpg",
                              width: 150.0,
                              height: 150.0,
                              fit: BoxFit.cover,
                            ),
                          );
                        }),
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        "$name $degree",
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
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: presentations.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  presentations[index]["day"] != "0"
                                      ? Text(
                                          "Jan ${presentations[index]["day"]}",
                                          style: GoogleFonts.raleway(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold))
                                      : Text("Poster",
                                          style: GoogleFonts.raleway(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold)),
                                  presentations[index]["day"] != "0"
                                      ? Text(presentations[index]["time"],
                                          style: GoogleFonts.raleway(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold))
                                      : const Text(""),
                                ],
                              ),
                              title: Text(
                                presentations[index]["title"],
                                style: GoogleFonts.raleway(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            );
                          }),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
