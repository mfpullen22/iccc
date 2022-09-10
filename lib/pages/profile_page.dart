import "package:flutter/material.dart";
import 'package:iccc_app/widgets/bottom_navbar.dart';

class ProfilePage extends StatelessWidget {
  final String name;
  final String university;
  final String position;
  final String email;
  final List<String> title;
  const ProfilePage({
    required this.name,
    required this.university,
    required this.position,
    required this.email,
    required this.title,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      extendBody: true,
      bottomNavigationBar: const BottomNavBarRaisedInsetFb1(),
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
                  )]
                  ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(0),
                    child: const Icon(Icons.account_circle, size: 200)
                  ),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  ),
                Text(
                  position,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
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
                  ) 
                ),
                Text(
                  "Contact: $email",
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
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
                  )]
                  ),
              child: Column(
                children: [
                  const Text("Presentations", 
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    decoration: TextDecoration.underline
                  )),
                  const SizedBox(height: 10),
                  for(var name in title) Text('"$name" \n', 
                  style: const TextStyle(
                    fontSize: 16,
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
