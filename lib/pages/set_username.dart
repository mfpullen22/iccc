import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:iccc_app/models/user_data.dart';
import 'package:iccc_app/pages/chat_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iccc_app/providers.dart';

class SetUsername extends ConsumerWidget {
  const SetUsername({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final user = FirebaseAuth.instance.currentUser!;
    //final username = user.displayName;
    final nameController = TextEditingController();

    if (user.displayName == null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Before you can begin chatting, we need to know what to call you! Please input a username below.",
              style: GoogleFonts.raleway(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your username',
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () async {
                //user.updateDisplayName(nameController.text);
                if (nameController.text != "") {
                  final newUser =
                      UserData.fromMap({"name": "test", "uid": user.uid});
                  try {
                    //ref.read(nameProvider).setName(nameController.text);
                    ref.read(nameProvider).setName(nameController.text);
                    await ref.read(databaseProvider)!.addUser(newUser);
                    // ignore: empty_catches
                  } catch (e) {}
                }
                // ignore: use_build_context_synchronously
                Navigator.push(
                  context,
                  // ignore: prefer_const_constructors
                  MaterialPageRoute(builder: (context) => ChatPage()),
                );
              },
              child: const Text("Submit"))
        ],
      );
    } else {
      return const ChatPage();
    }
  }
}
