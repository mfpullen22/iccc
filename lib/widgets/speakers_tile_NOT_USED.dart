// ignore_for_file: file_names

/* import "package:flutter/material.dart";
import 'package:iccc_app/pages/profile_page.dart';

class SpeakerTile extends StatelessWidget {
  final String name;
  final String university;
  final String position;
  final String title;
  final String email;
  const SpeakerTile(
      {required this.name,
      required this.university,
      required this.position,
      required this.title,
      required this.email,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        width: screenSize.width * 0.9,
        height: 95,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.5),
          boxShadow: [
            BoxShadow(
                offset: const Offset(10, 20),
                blurRadius: 10,
                spreadRadius: 0,
                color: Colors.grey.withOpacity(0.05)),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(0),
              child: const Icon(Icons.account_circle),
            ),
            const SizedBox(width: 15),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfilePage(
                              name: name,
                              university: university,
                              position: position,
                              email: email,
                              title: title,
                              totalList: [],
                            )));
              },
              child: SizedBox(
                width: screenSize.width * 0.75,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        university,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Text(
                      position,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
 */