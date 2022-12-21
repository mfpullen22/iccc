import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:iccc_app/models/user_data.dart';
import 'package:iccc_app/pages/chat_main_page.dart';
import 'package:iccc_app/widgets/bottom_navbar.dart';
import "package:iccc_app/providers.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SetProfilePage extends ConsumerWidget {
  const SetProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    var username = TextEditingController();
    var user = FirebaseAuth.instance.currentUser;
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                  "Before you can chat, we need to know what to call you! (Please include FIRST and LAST names)",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.raleway(
                      fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 40,
              ),
              Text("Please include your first and last name.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.raleway(
                      fontSize: 14, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 40,
              ),
              CustomInputFieldFb1(
                  inputController: username,
                  hintText: "What's your name?",
                  labelText: "Name"),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  onPressed: () {
                    var newUser = UserData(
                        name: username.text,
                        uid: FirebaseAuth.instance.currentUser!.uid);
                    ref.read(databaseProvider)!.addUser(newUser);
                    user?.updateDisplayName(username.text);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ChatMainPage()));
                  },
                  child: const Text("Set Username"))
            ],
          ),
        ),
        bottomNavigationBar: const BottomNavBarFb5(pageIndex: 4),
      ),
    );
  }
}

class CustomInputFieldFb1 extends StatelessWidget {
  final TextEditingController inputController;
  final String hintText;
  final Color primaryColor;
  final String labelText;

  const CustomInputFieldFb1(
      {Key? key,
      required this.inputController,
      required this.hintText,
      required this.labelText,
      this.primaryColor = Colors.indigo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 50,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: const Offset(12, 26),
            blurRadius: 50,
            spreadRadius: 0,
            color: Colors.grey.withOpacity(.1)),
      ]),
      child: TextField(
        controller: inputController,
/*         onChanged: (value) {
          //Do something wi
        }, */
        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(fontSize: 16, color: Colors.black),
        decoration: InputDecoration(
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey.withOpacity(.75)),
          fillColor: Colors.transparent,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
          border: UnderlineInputBorder(
            borderSide:
                BorderSide(color: primaryColor.withOpacity(.1), width: 2.0),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: primaryColor, width: 2.0),
          ),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2.0),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: primaryColor.withOpacity(.1), width: 2.0),
          ),
        ),
      ),
    );
  }
}
