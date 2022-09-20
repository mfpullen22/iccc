import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
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
      return Scaffold(
        appBar: AppBar(
          title: Text("Set Username"),
        ),
        body: Column(
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
            SizedBox(height: 20),
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
                    } catch (e) {}
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChatPage()),
                  );
                },
                child: Text("Submit"))
          ],
        ),
      );
    } else {
      return ChatPage();
    }
  }
}
